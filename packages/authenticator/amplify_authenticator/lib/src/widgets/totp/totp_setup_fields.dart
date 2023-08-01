// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:amplify_authenticator/src/l10n/button_resolver.dart';
import 'package:amplify_authenticator/src/widgets/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

mixin TotpSetupFields<FieldType extends Enum,
        T extends AuthenticatorFormField<FieldType, String>>
    on AuthenticatorFormFieldState<FieldType, String, T> {
  bool showKey = false;
  bool showQRCode = false;

  Uri get totpUri {
    final totpUri = state.totpSetupUri;

    assert(
      totpUri != null,
      'Expected TOTP setup uri in state for current screen, instead got $totpUri',
    );
    return totpUri!;
  }

  String getButtonText(ButtonResolverKey key) {
    return stringResolver.buttons.resolve(
      context,
      key,
    );
  }

  Future<void> _copyKey() async {
    setState(() {
      showKey = true;
    });
    try {
      await Clipboard.setData(
        ClipboardData(text: state.totpSetupDetails!.sharedSecret),
      ).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            content: const Text(
              'Copied to clipboard!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      });
    } on PlatformException {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.onError,
          content: const Text(
            'Copy to clipboard failed.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  // Returns a filled button if the conditional is enabled,
  // otherwise returns outline button
  Widget iconToggleButton({
    required bool conditional,
    required IconData icon,
    required String label,
    required void Function() onPressed,
  }) {
    return conditional
        ? FilledButton.tonalIcon(
            onPressed: onPressed,
            icon: Icon(icon),
            label: Center(
              child: Text(
                label,
              ),
            ),
          )
        : OutlinedButton.icon(
            onPressed: onPressed,
            icon: Icon(icon),
            label: Center(
              child: Text(
                label,
              ),
            ),
          );
  }

  Widget optionDivider() {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            height: 0,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'or',
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Divider(
            height: 0,
          ),
        ),
      ],
    );
  }

  @override
  Widget buildFormField(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final isMobile = Theme.of(context).platform == TargetPlatform.iOS ||
        Theme.of(context).platform == TargetPlatform.android;
    const widgetTopPadding = EdgeInsets.only(top: 20);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// QR Code Toggle Button
        if (isMobile) ...[
          optionDivider(),
          const Padding(padding: widgetTopPadding),
          iconToggleButton(
            conditional: showQRCode,
            icon: Icons.qr_code,
            label: getButtonText(ButtonResolverKey.totpQrCode),
            onPressed: () => setState(() {
              showQRCode = !showQRCode;
              showKey = false;
            }),
          ),
        ],

        /// QR Code
        /// Shown on desktop or when toggled on mobile
        if (!isMobile || showQRCode) ...[
          const Padding(padding: widgetTopPadding),
          Center(
            child: QrImageView(
              size: 150,
              padding: EdgeInsets.zero,
              eyeStyle:
                  QrEyeStyle(color: isDarkMode ? Colors.white : Colors.black),
              dataModuleStyle: QrDataModuleStyle(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              data: totpUri.toString(),
              version: QrVersions.auto,
            ),
          ),
        ],

        const Padding(padding: widgetTopPadding),
        optionDivider(),
        const Padding(padding: widgetTopPadding),

        /// Manual Key Toggle Button
        if (isMobile) ...[
          iconToggleButton(
            conditional: showKey,
            icon: Icons.key_outlined,
            label: getButtonText(ButtonResolverKey.totpManualKey),
            onPressed: () => setState(() {
              showKey = !showKey;
              showQRCode = false;
            }),
          ),
        ],

        const Padding(padding: widgetTopPadding),

        /// Manual Key
        /// Shown on desktop or when toggled on mobile
        if (showKey || !isMobile)
          Row(
            children: [
              IconButton.filledTonal(
                onPressed: _copyKey,
                icon: const Icon(Icons.copy),
              ),
              const Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(
                child: SelectableText(
                  state.totpSetupDetails!.sharedSecret,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}

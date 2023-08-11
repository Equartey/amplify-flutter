// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:amplify_authenticator/src/l10n/button_resolver.dart';
import 'package:amplify_authenticator/src/widgets/form_field.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

mixin TotpQrCode<FieldType extends Enum,
        T extends AuthenticatorFormField<FieldType, String>>
    on AuthenticatorFormFieldState<FieldType, String, T> {
  /// Retrieves the TOTP setup uri from the state
  Uri get totpUri {
    final totpUri = state.totpSetupUri;

    assert(
      totpUri != null,
      'Expected TOTP setup uri in state for current screen, instead got $totpUri',
    );
    return totpUri!;
  }

  @override
  Widget buildFormField(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          stringResolver.buttons.resolve(
            context,
            ButtonResolverKey.totpQrCodeInstruction,
          ),
        ),
        const SizedBox(height: 20),
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
    );
  }
}

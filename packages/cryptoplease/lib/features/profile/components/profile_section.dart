import 'package:auto_route/auto_route.dart';
import 'package:cryptoplease/app/routes.dart';
import 'package:cryptoplease/config.dart';
import 'package:cryptoplease/core/accounts/bl/accounts_bloc.dart';
import 'package:cryptoplease/core/presentation/dialogs.dart';
import 'package:cryptoplease/core/presentation/utils.dart';
import 'package:cryptoplease/features/airdrop/presentation/airdrop_button.dart';
import 'package:cryptoplease/features/app_lock/presentation/app_lock_button.dart';
import 'package:cryptoplease/features/backup_phrase/presentation/recovery_phrase_button.dart';
import 'package:cryptoplease/features/incoming_split_key_payment/bl/repository.dart';
import 'package:cryptoplease/features/payment_request/bl/repository.dart';
import 'package:cryptoplease/features/profile/components/profile_button.dart';
import 'package:cryptoplease/l10n/l10n.dart';
import 'package:cryptoplease_ui/cryptoplease_ui.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

part 'about_section.dart';
part 'danger_section.dart';
part 'debug_section.dart';
part 'edit_profile_section.dart';
part 'security_section.dart';
part 'version_section.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    Key? key,
    required this.title,
    required this.actions,
    this.color = CpColors.primaryTextColor,
  }) : super(key: key);

  final String title;
  final List<Widget> actions;
  final Color color;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: color,
                  ),
              textAlign: TextAlign.left,
            ),
          ),
          ...actions,
        ],
      );
}

import 'package:auto_route/auto_route.dart';
import 'package:cryptoplease/app/screens/authenticated/flow.dart';
import 'package:cryptoplease/app/screens/authenticated/home_tabs_screen.dart';
import 'package:cryptoplease/app/screens/authenticated/receive_flow/routes.dart';
import 'package:cryptoplease/app/screens/authenticated/wallet_screen.dart';
import 'package:cryptoplease/features/activities/presentation/activities_screen.dart';
import 'package:cryptoplease/features/add_funds/presentation/routes.dart';
import 'package:cryptoplease/features/app_lock/presentation/routes.dart';
import 'package:cryptoplease/features/backup_phrase/presentation/routes.dart';
import 'package:cryptoplease/features/legal/legal_document_view.dart';
import 'package:cryptoplease/features/nft/presentation/nft_details_screen.dart';
import 'package:cryptoplease/features/nft/presentation/nft_screen.dart';
import 'package:cryptoplease/features/outgoing_transfer/presentation/outgoing_transfer_flow/outgoing_transfer_flow.dart';
import 'package:cryptoplease/features/outgoing_transfer/presentation/send_flow/routes.dart';
import 'package:cryptoplease/features/profile/edit_profile_screen.dart';
import 'package:cryptoplease/features/profile/help_screen.dart';
import 'package:cryptoplease/features/profile/profile_screen.dart';
import 'package:cryptoplease/features/swap_tokens/presentation/routes.dart';
import 'package:cryptoplease/features/swap_tokens/presentation/swap_token_flow.dart';
import 'package:cryptoplease/features/transactions/presentation/transaction_details_screen/transaction_details_screen.dart';
import 'package:cryptoplease/features/transactions/presentation/transactions_screen/transactions_screen.dart';

const authenticatedFlowRoutes = AutoRoute<void>(
  page: AuthenticatedFlowScreen,
  children: [
    AutoRoute<void>(
      path: '',
      page: HomeTabsScreen,
      children: [
        CustomRoute<void>(path: '', page: WalletScreen),
        CustomRoute<void>(page: NftScreen),
        CustomRoute<void>(page: ActivitiesScreen),
        CustomRoute<void>(page: SwapTokenFlowScreen, children: swapTokenRoutes),
        CustomRoute<void>(page: ProfileScreen),
      ],
    ),
    ...backupPhraseRoutes,
    AutoRoute<void>(page: NftDetailsScreen),
    AutoRoute<void>(page: TransactionsScreen),
    AutoRoute<void>(page: TransactionDetailsScreen),
    ...createPaymentFlowRoutes,
    AutoRoute<void>(page: OutgoingTransferFlowScreen),
    ...receiveFlowRoutes,
    ...addFundsRoutes,
    appLockSetupFlowRoutes,
    AutoRoute<void>(page: EditProfileScreen),
    AutoRoute<void>(page: TermsOfServiceScreen),
    AutoRoute<void>(page: PrivacyPolicyScreen),
    AutoRoute<void>(page: HelpScreen),
  ],
);

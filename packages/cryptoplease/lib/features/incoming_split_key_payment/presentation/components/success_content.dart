import 'package:cryptoplease/app/components/common_success.dart';
import 'package:cryptoplease/core/accounts/bl/accounts_bloc.dart';
import 'package:cryptoplease/core/balances/bl/balances_bloc.dart';
import 'package:cryptoplease/features/incoming_split_key_payment/bl/bloc.dart';
import 'package:cryptoplease/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SuccessContent extends StatelessWidget {
  const SuccessContent({Key? key}) : super(key: key);

  void _onSuccessConfirmed(BuildContext context) {
    context
        .read<SplitKeyIncomingPaymentBloc>()
        .add(const SplitKeyIncomingPaymentEvent.cleared());

    // ignore: avoid-non-null-assertion, cannot be null here
    final account = context.read<AccountsBloc>().state.account!;
    context
        .read<BalancesBloc>()
        .add(BalancesEvent.requested(address: account.address));
  }

  @override
  Widget build(BuildContext context) => CommonSuccess(
        text: context.l10n.splitKeySuccessMessage,
        onClosePressed: () => _onSuccessConfirmed(context),
      );
}

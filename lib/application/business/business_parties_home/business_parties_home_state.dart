part of 'business_parties_home_bloc.dart';

@immutable
abstract class BusinessPartiesHomeState {
  final List<PartiesListDatum> parties;

  const BusinessPartiesHomeState({required this.parties});
}

class BusinessPartiesHomeInitialState extends BusinessPartiesHomeState {
  const BusinessPartiesHomeInitialState({required super.parties});
}

class BusinessPartiesHomeLoadingState extends BusinessPartiesHomeState {
  const BusinessPartiesHomeLoadingState({required super.parties});
}

class BusinessPartiesHomeSuccessState extends BusinessPartiesHomeState {
  const BusinessPartiesHomeSuccessState({required super.parties});
}

class BusinessPartiesHomeNoPartyState extends BusinessPartiesHomeState {
  const BusinessPartiesHomeNoPartyState({required super.parties});
}

class BusinessPartiesHomeErrorState extends BusinessPartiesHomeState {
  const BusinessPartiesHomeErrorState({required super.parties});
}

class BusinessPartiesHomeNewPartyLoadingState extends BusinessPartiesHomeState {
  const BusinessPartiesHomeNewPartyLoadingState({required super.parties});
}

class BusinessPartiesHomeNewPartySuccessState extends BusinessPartiesHomeState {
  const BusinessPartiesHomeNewPartySuccessState({required super.parties});
}

class BusinessPartiesHomeNewPartyErrorState extends BusinessPartiesHomeState {
  const BusinessPartiesHomeNewPartyErrorState({required super.parties});
}

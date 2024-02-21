import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
 import 'package:quickprism/domain/user/i_user_repo.dart';
import 'package:quickprism/domain/user/models/parties/parties_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';

part 'business_parties_home_event.dart';
part 'business_parties_home_state.dart';

@injectable
class BusinessPartiesHomeBloc
    extends Bloc<BusinessPartiesHomeEvent, BusinessPartiesHomeState> {
  final IUserRepo _userRepo;
  List<PartiesListDatum> partiesList = [];
  BusinessPartiesHomeBloc(this._userRepo)
      : super(const BusinessPartiesHomeInitialState(parties: [])) {
    on<BusinessPartiesHomeInitialEvent>(_getAllParties);
    on<BusinessPartiesHomeSearchPartyEvent>(_getSearchedParties);
    on<BusinessPartiesCreateNewPartyEvent>(_createNewParty);
  }

  Future<void> _getAllParties(
    BusinessPartiesHomeInitialEvent event,
    Emitter<BusinessPartiesHomeState> emit,
  ) async {
    emit(const BusinessPartiesHomeLoadingState(parties: []));
    final partiesResponse = await _userRepo.getAllParties();
    partiesResponse.fold((l) {
      emit(const BusinessPartiesHomeErrorState(parties: []));
    }, (r) {
      partiesList = r.data!;
      UserConstants.partiesList = partiesList;
      if (partiesList.isEmpty) {
        emit(const BusinessPartiesHomeNoPartyState(parties: []));
      } else {
        emit(BusinessPartiesHomeSuccessState(parties: partiesList));
      }
    });
  }

  void _getSearchedParties(
    BusinessPartiesHomeSearchPartyEvent event,
    Emitter<BusinessPartiesHomeState> emit,
  ) {
    if (event.searchText.isEmpty) {
      emit(BusinessPartiesHomeSuccessState(parties: partiesList));
    } else {
      var partiesSearchedResults = UserConstants.partiesList
          // var partiesSearchedResults = partiesList
          .where((element) => element.name!
              .toLowerCase()
              .contains(event.searchText.toLowerCase()))
          .toList();
      emit(BusinessPartiesHomeSuccessState(parties: partiesSearchedResults));
    }
  }

  Future<void> _createNewParty(
    BusinessPartiesCreateNewPartyEvent event,
    Emitter<BusinessPartiesHomeState> emit,
  ) async {
    emit(const BusinessPartiesHomeNewPartyLoadingState(parties: []));
    final res = await _userRepo.createNewParty(
        createdBy:
            UserConstants.currentBusiness?.businessProfile?.businessId ?? 1,
        name: event.name,
        gstNo: event.gstNo,
        businessType: event.businessType,
        mobileNo: event.mobileNo,
        streetAddress: event.streetAddress,
        pinCode: event.pinCode,
        city: event.city,
        state: event.state);
    res.fold((l) {
      emit(const BusinessPartiesHomeNewPartyErrorState(parties: []));
    }, (r) async{
    //  await _getAllParties(BusinessPartiesHomeInitialEvent(), emit);
      emit(const BusinessPartiesHomeNewPartySuccessState(parties: []));
    });
  }
}

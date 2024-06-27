import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wallet_app/apiBase.dart';
import 'package:wallet_app/ui/onboarding/airdrop_request.dart';
import 'package:wallet_app/ui/onboarding/airdrop_response.dart';
import 'package:wallet_app/ui/onboarding/balance_response.dart';
import 'package:wallet_app/ui/onboarding/balance_transfer_request.dart';
import 'package:wallet_app/ui/onboarding/login_response.dart';
import 'package:wallet_app/ui/onboarding/transfer_balance_response.dart';
import 'package:wallet_app/ui/onboarding/wallet_response.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST('/user/login')
  Future<LoginResponse> login(
    @Field('mixed') String mixed,
    @Field('password') String password,
  );

  @POST('/solana/wallet/create')
  Future<WalletResponse> createWallet(
    @Header('Authorization') String token,
    @Field('wallet_name') String walletName,
    @Field('network') String network,
    @Field('user_pin') String userPin,
  );

  @POST('/solana/wallet/transfer')
  Future<TransferBalanceResponse> transferBalance(
    @Header('Authorization') String token,
    @Body() BalanceTransferRequest request,
  );

  @GET('/solana/wallet/balance')
  Future<BalanceResponse> retrieveBalance(
    @Header('Authorization') String token,
    @Query('network') String network,
    @Query('wallet_address') String walletAddress,
  );

  @POST('/solana/wallet/airdrop')
  Future<AirdropResponse> requestAirdrop(
    @Header('Authorization') String token,
    @Body() AirdropRequest request,
  );
}

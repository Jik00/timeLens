import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/build_error_snack_bar.dart';
import 'package:timelens/features/chatbot/presentation/cubits/fetch_chats_cubit/fetch_chats_cubit.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/chats_history.dart';

class ChatsHistoryBlocConsumer extends StatelessWidget {
  const ChatsHistoryBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchChatsCubit, FetchChatsState>(
      listener: (context, state) {
        if (state is FetchChatsFailure) {
          buildErrorSnackBar(context, context.loc.failedToFetchChats);
        }
      },
      builder: (context, state) {
        if (state is FetchChatsSuccess && state.chats.isEmpty) {
          return Text(
            context.loc.noChats,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.brownWriting,
            ),
          );
        } else {
          return ModalProgressHUD(
            opacity: 0.2,
            inAsyncCall: state is FetchChatsLoading,
            child: ChatsHistory(chats: state.chats),
          );
        }
      },
    );
  }
}

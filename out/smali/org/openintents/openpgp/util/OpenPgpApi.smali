.class public Lorg/openintents/openpgp/util/OpenPgpApi;
.super Ljava/lang/Object;
.source "OpenPgpApi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;,
        Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;
    }
.end annotation


# static fields
.field public static final ACTION_DECRYPT_METADATA:Ljava/lang/String; = "org.openintents.openpgp.action.DECRYPT_METADATA"

.field public static final ACTION_DECRYPT_VERIFY:Ljava/lang/String; = "org.openintents.openpgp.action.DECRYPT_VERIFY"

.field public static final ACTION_ENCRYPT:Ljava/lang/String; = "org.openintents.openpgp.action.ENCRYPT"

.field public static final ACTION_GET_KEY:Ljava/lang/String; = "org.openintents.openpgp.action.GET_KEY"

.field public static final ACTION_GET_KEY_IDS:Ljava/lang/String; = "org.openintents.openpgp.action.GET_KEY_IDS"

.field public static final ACTION_SIGN:Ljava/lang/String; = "org.openintents.openpgp.action.SIGN"

.field public static final ACTION_SIGN_AND_ENCRYPT:Ljava/lang/String; = "org.openintents.openpgp.action.SIGN_AND_ENCRYPT"

.field public static final API_VERSION:I = 0x5

.field public static final EXTRA_ACCOUNT_NAME:Ljava/lang/String; = "account_name"

.field public static final EXTRA_API_VERSION:Ljava/lang/String; = "api_version"

.field public static final EXTRA_KEY_ID:Ljava/lang/String; = "key_id"

.field public static final EXTRA_KEY_IDS:Ljava/lang/String; = "key_ids"

.field public static final EXTRA_NFC_DECRYPTED_SESSION_KEY:Ljava/lang/String; = "nfc_decrypted_session_key"

.field public static final EXTRA_NFC_SIGNED_HASH:Ljava/lang/String; = "nfc_signed_hash"

.field public static final EXTRA_NFC_SIG_CREATION_TIMESTAMP:Ljava/lang/String; = "nfc_sig_creation_timestamp"

.field public static final EXTRA_ORIGINAL_FILENAME:Ljava/lang/String; = "original_filename"

.field public static final EXTRA_PASSPHRASE:Ljava/lang/String; = "passphrase"

.field public static final EXTRA_REQUEST_ASCII_ARMOR:Ljava/lang/String; = "ascii_armor"

.field public static final EXTRA_USER_IDS:Ljava/lang/String; = "user_ids"

.field public static final RESULT_CODE:Ljava/lang/String; = "result_code"

.field public static final RESULT_CODE_ERROR:I = 0x0

.field public static final RESULT_CODE_SUCCESS:I = 0x1

.field public static final RESULT_CODE_USER_INTERACTION_REQUIRED:I = 0x2

.field public static final RESULT_ERROR:Ljava/lang/String; = "error"

.field public static final RESULT_INTENT:Ljava/lang/String; = "intent"

.field public static final RESULT_KEY_IDS:Ljava/lang/String; = "key_ids"

.field public static final RESULT_METADATA:Ljava/lang/String; = "metadata"

.field public static final RESULT_SIGNATURE:Ljava/lang/String; = "signature"

.field public static final SERVICE_INTENT:Ljava/lang/String; = "org.openintents.openpgp.IOpenPgpService"

.field public static final TAG:Ljava/lang/String; = "OpenPgp API"


# instance fields
.field mContext:Landroid/content/Context;

.field mService:Lorg/openintents/openpgp/IOpenPgpService;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/openintents/openpgp/IOpenPgpService;)V
    .locals 0
    .parameter "context"
    .parameter "service"

    .prologue
    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 205
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpApi;->mContext:Landroid/content/Context;

    .line 206
    iput-object p2, p0, Lorg/openintents/openpgp/util/OpenPgpApi;->mService:Lorg/openintents/openpgp/IOpenPgpService;

    .line 207
    return-void
.end method


# virtual methods
.method public executeApi(Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;)Landroid/content/Intent;
    .locals 8
    .parameter "data"
    .parameter "is"
    .parameter "os"

    .prologue
    .line 252
    :try_start_0
    const-string v4, "api_version"

    const/4 v5, 0x5

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 257
    const/4 v1, 0x0

    .line 258
    .local v1, input:Landroid/os/ParcelFileDescriptor;
    if-eqz p2, :cond_0

    .line 259
    new-instance v4, Lorg/openintents/openpgp/util/OpenPgpApi$1;

    invoke-direct {v4, p0}, Lorg/openintents/openpgp/util/OpenPgpApi$1;-><init>(Lorg/openintents/openpgp/util/OpenPgpApi;)V

    invoke-static {p2, v4}, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil;->pipeFrom(Ljava/io/InputStream;Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$IThreadListener;)Landroid/os/ParcelFileDescriptor;

    move-result-object v1

    .line 269
    :cond_0
    const/4 v2, 0x0

    .line 270
    .local v2, output:Landroid/os/ParcelFileDescriptor;
    if-eqz p3, :cond_1

    .line 271
    new-instance v4, Lorg/openintents/openpgp/util/OpenPgpApi$2;

    invoke-direct {v4, p0}, Lorg/openintents/openpgp/util/OpenPgpApi$2;-><init>(Lorg/openintents/openpgp/util/OpenPgpApi;)V

    invoke-static {p3, v4}, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil;->pipeTo(Ljava/io/OutputStream;Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$IThreadListener;)Landroid/os/ParcelFileDescriptor;

    move-result-object v2

    .line 283
    :cond_1
    iget-object v4, p0, Lorg/openintents/openpgp/util/OpenPgpApi;->mService:Lorg/openintents/openpgp/IOpenPgpService;

    invoke-interface {v4, p1, v1, v2}, Lorg/openintents/openpgp/IOpenPgpService;->execute(Landroid/content/Intent;Landroid/os/ParcelFileDescriptor;Landroid/os/ParcelFileDescriptor;)Landroid/content/Intent;

    move-result-object v3

    .line 285
    .local v3, result:Landroid/content/Intent;
    if-eqz v2, :cond_2

    .line 286
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 293
    :cond_2
    iget-object v4, p0, Lorg/openintents/openpgp/util/OpenPgpApi;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/content/Intent;->setExtrasClassLoader(Ljava/lang/ClassLoader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 302
    .end local v1           #input:Landroid/os/ParcelFileDescriptor;
    .end local v2           #output:Landroid/os/ParcelFileDescriptor;
    :goto_0
    return-object v3

    .line 296
    .end local v3           #result:Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 297
    .local v0, e:Ljava/lang/Exception;
    const-string v4, "OpenPgp API"

    const-string v5, "Exception in executeApi call"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 298
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 299
    .restart local v3       #result:Landroid/content/Intent;
    const-string v4, "result_code"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 300
    const-string v4, "error"

    new-instance v5, Lorg/openintents/openpgp/OpenPgpError;

    const/4 v6, -0x1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/openintents/openpgp/OpenPgpError;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_0
.end method

.method public executeApiAsync(Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;)V
    .locals 7
    .parameter "data"
    .parameter "is"
    .parameter "os"
    .parameter "callback"
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 239
    new-instance v0, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;-><init>(Lorg/openintents/openpgp/util/OpenPgpApi;Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;Lorg/openintents/openpgp/util/OpenPgpApi$1;)V

    .line 243
    .local v0, task:Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_0

    .line 244
    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    check-cast v6, [Ljava/lang/Void;

    invoke-virtual {v0, v1, v6}, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 248
    :goto_0
    return-void

    .line 246
    :cond_0
    check-cast v6, [Ljava/lang/Void;

    invoke-virtual {v0, v6}, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method

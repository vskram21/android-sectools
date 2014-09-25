.class Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$8;
.super Ljava/lang/Object;
.source "OpenPgpProviderActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->showToast(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;

.field final synthetic val$message:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 155
    iput-object p1, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$8;->this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;

    iput-object p2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$8;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 159
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$8;->this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;

    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$8;->val$message:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 162
    return-void
.end method

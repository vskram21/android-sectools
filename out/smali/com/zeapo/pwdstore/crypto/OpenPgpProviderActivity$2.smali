.class Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$2;
.super Ljava/lang/Object;
.source "OpenPgpProviderActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;


# direct methods
.method constructor <init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 96
    iput-object p1, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$2;->this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 99
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$2;->this$0:Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v0, v1}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->encrypt(Landroid/content/Intent;)V

    .line 100
    return-void
.end method

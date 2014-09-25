.class Lcom/zeapo/pwdstore/crypto/PgpHandler$3;
.super Ljava/lang/Object;
.source "PgpHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/crypto/PgpHandler;->encrypt(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;


# direct methods
.method constructor <init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 452
    iput-object p1, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$3;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .parameter "dialog"
    .parameter "id"

    .prologue
    .line 456
    return-void
.end method

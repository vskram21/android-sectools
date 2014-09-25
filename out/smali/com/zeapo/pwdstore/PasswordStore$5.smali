.class Lcom/zeapo/pwdstore/PasswordStore$5;
.super Ljava/lang/Object;
.source "PasswordStore.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/PasswordStore;->deletePassword(Lcom/zeapo/pwdstore/utils/PasswordItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zeapo/pwdstore/PasswordStore;


# direct methods
.method constructor <init>(Lcom/zeapo/pwdstore/PasswordStore;)V
    .locals 0
    .parameter

    .prologue
    .line 336
    iput-object p1, p0, Lcom/zeapo/pwdstore/PasswordStore$5;->this$0:Lcom/zeapo/pwdstore/PasswordStore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .parameter "dialogInterface"
    .parameter "i"

    .prologue
    .line 340
    return-void
.end method

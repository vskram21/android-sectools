.class Lcom/zeapo/pwdstore/PasswordStore$2;
.super Ljava/lang/Object;
.source "PasswordStore.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/PasswordStore;->initRepository(Landroid/view/View;)V
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
    .line 168
    iput-object p1, p0, Lcom/zeapo/pwdstore/PasswordStore$2;->this$0:Lcom/zeapo/pwdstore/PasswordStore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialogInterface"
    .parameter "i"

    .prologue
    .line 171
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/zeapo/pwdstore/PasswordStore$2;->this$0:Lcom/zeapo/pwdstore/PasswordStore;

    #getter for: Lcom/zeapo/pwdstore/PasswordStore;->activity:Landroid/app/Activity;
    invoke-static {v1}, Lcom/zeapo/pwdstore/PasswordStore;->access$000(Lcom/zeapo/pwdstore/PasswordStore;)Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/zeapo/pwdstore/UserPreference;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 172
    .local v0, intent:Landroid/content/Intent;
    iget-object v1, p0, Lcom/zeapo/pwdstore/PasswordStore$2;->this$0:Lcom/zeapo/pwdstore/PasswordStore;

    const/16 v2, 0x68

    invoke-virtual {v1, v0, v2}, Lcom/zeapo/pwdstore/PasswordStore;->startActivityForResult(Landroid/content/Intent;I)V

    .line 173
    return-void
.end method

.class Lcom/zeapo/pwdstore/PasswordStore$3;
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
    .line 193
    iput-object p1, p0, Lcom/zeapo/pwdstore/PasswordStore$3;->this$0:Lcom/zeapo/pwdstore/PasswordStore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialogInterface"
    .parameter "i"

    .prologue
    .line 196
    iget-object v0, p0, Lcom/zeapo/pwdstore/PasswordStore$3;->this$0:Lcom/zeapo/pwdstore/PasswordStore;

    #getter for: Lcom/zeapo/pwdstore/PasswordStore;->settings:Landroid/content/SharedPreferences;
    invoke-static {v0}, Lcom/zeapo/pwdstore/PasswordStore;->access$100(Lcom/zeapo/pwdstore/PasswordStore;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "git_remote_auth"

    const-string v2, "username/password"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 197
    iget-object v0, p0, Lcom/zeapo/pwdstore/PasswordStore$3;->this$0:Lcom/zeapo/pwdstore/PasswordStore;

    #calls: Lcom/zeapo/pwdstore/PasswordStore;->createRepository()V
    invoke-static {v0}, Lcom/zeapo/pwdstore/PasswordStore;->access$200(Lcom/zeapo/pwdstore/PasswordStore;)V

    .line 198
    return-void
.end method

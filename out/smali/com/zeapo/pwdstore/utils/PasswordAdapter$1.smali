.class Lcom/zeapo/pwdstore/utils/PasswordAdapter$1;
.super Ljava/lang/Object;
.source "PasswordAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/utils/PasswordAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zeapo/pwdstore/utils/PasswordAdapter;

.field final synthetic val$pass:Lcom/zeapo/pwdstore/utils/PasswordItem;


# direct methods
.method constructor <init>(Lcom/zeapo/pwdstore/utils/PasswordAdapter;Lcom/zeapo/pwdstore/utils/PasswordItem;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 81
    iput-object p1, p0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$1;->this$0:Lcom/zeapo/pwdstore/utils/PasswordAdapter;

    iput-object p2, p0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$1;->val$pass:Lcom/zeapo/pwdstore/utils/PasswordItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 84
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 92
    :goto_0
    return-void

    .line 86
    :sswitch_0
    iget-object v0, p0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$1;->this$0:Lcom/zeapo/pwdstore/utils/PasswordAdapter;

    #getter for: Lcom/zeapo/pwdstore/utils/PasswordAdapter;->activity:Lcom/zeapo/pwdstore/PasswordStore;
    invoke-static {v0}, Lcom/zeapo/pwdstore/utils/PasswordAdapter;->access$000(Lcom/zeapo/pwdstore/utils/PasswordAdapter;)Lcom/zeapo/pwdstore/PasswordStore;

    move-result-object v0

    iget-object v1, p0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$1;->val$pass:Lcom/zeapo/pwdstore/utils/PasswordItem;

    invoke-virtual {v0, v1}, Lcom/zeapo/pwdstore/PasswordStore;->decryptPassword(Lcom/zeapo/pwdstore/utils/PasswordItem;)V

    goto :goto_0

    .line 89
    :sswitch_1
    iget-object v0, p0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$1;->this$0:Lcom/zeapo/pwdstore/utils/PasswordAdapter;

    #getter for: Lcom/zeapo/pwdstore/utils/PasswordAdapter;->activity:Lcom/zeapo/pwdstore/PasswordStore;
    invoke-static {v0}, Lcom/zeapo/pwdstore/utils/PasswordAdapter;->access$000(Lcom/zeapo/pwdstore/utils/PasswordAdapter;)Lcom/zeapo/pwdstore/PasswordStore;

    move-result-object v0

    iget-object v1, p0, Lcom/zeapo/pwdstore/utils/PasswordAdapter$1;->val$pass:Lcom/zeapo/pwdstore/utils/PasswordItem;

    invoke-virtual {v0, v1}, Lcom/zeapo/pwdstore/PasswordStore;->deletePassword(Lcom/zeapo/pwdstore/utils/PasswordItem;)V

    goto :goto_0

    .line 84
    :sswitch_data_0
    .sparse-switch
        0x7f090047 -> :sswitch_0
        0x7f09004b -> :sswitch_1
    .end sparse-switch
.end method

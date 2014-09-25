.class Lcom/zeapo/pwdstore/GitHandler$1;
.super Ljava/lang/Object;
.source "GitHandler.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/GitHandler;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zeapo/pwdstore/GitHandler;


# direct methods
.method constructor <init>(Lcom/zeapo/pwdstore/GitHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 96
    iput-object p1, p0, Lcom/zeapo/pwdstore/GitHandler$1;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .parameter
    .parameter "view"
    .parameter "i"
    .parameter "l"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .local p1, adapterView:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const v3, 0x7f090043

    .line 99
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler$1;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    iget-object v0, p0, Lcom/zeapo/pwdstore/GitHandler$1;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    const v2, 0x7f090042

    invoke-virtual {v0, v2}, Lcom/zeapo/pwdstore/GitHandler;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    #setter for: Lcom/zeapo/pwdstore/GitHandler;->protocol:Ljava/lang/String;
    invoke-static {v1, v0}, Lcom/zeapo/pwdstore/GitHandler;->access$002(Lcom/zeapo/pwdstore/GitHandler;Ljava/lang/String;)Ljava/lang/String;

    .line 100
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitHandler$1;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    #getter for: Lcom/zeapo/pwdstore/GitHandler;->protocol:Ljava/lang/String;
    invoke-static {v0}, Lcom/zeapo/pwdstore/GitHandler;->access$000(Lcom/zeapo/pwdstore/GitHandler;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "ssh://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitHandler$1;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    invoke-virtual {v0, v3}, Lcom/zeapo/pwdstore/GitHandler;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string v1, "user@hostname:path"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 114
    :goto_0
    return-void

    .line 103
    :cond_0
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitHandler$1;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    invoke-virtual {v0, v3}, Lcom/zeapo/pwdstore/GitHandler;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string v1, "hostname/path"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 104
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler$1;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    #getter for: Lcom/zeapo/pwdstore/GitHandler;->activity:Landroid/app/Activity;
    invoke-static {v1}, Lcom/zeapo/pwdstore/GitHandler;->access$100(Lcom/zeapo/pwdstore/GitHandler;)Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "You are about to use a read-only repository, you will not be able to push to it"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "OK"

    new-instance v2, Lcom/zeapo/pwdstore/GitHandler$1$1;

    invoke-direct {v2, p0}, Lcom/zeapo/pwdstore/GitHandler$1$1;-><init>(Lcom/zeapo/pwdstore/GitHandler$1;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 119
    .local p1, adapterView:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    return-void
.end method

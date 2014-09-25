.class Lorg/openintents/openpgp/util/OpenPgpListPreference$2;
.super Ljava/lang/Object;
.source "OpenPgpListPreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/openintents/openpgp/util/OpenPgpListPreference;->onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/openintents/openpgp/util/OpenPgpListPreference;


# direct methods
.method constructor <init>(Lorg/openintents/openpgp/util/OpenPgpListPreference;)V
    .locals 0
    .parameter

    .prologue
    .line 144
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference$2;->this$0:Lorg/openintents/openpgp/util/OpenPgpListPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 148
    iget-object v1, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference$2;->this$0:Lorg/openintents/openpgp/util/OpenPgpListPreference;

    #getter for: Lorg/openintents/openpgp/util/OpenPgpListPreference;->mList:Ljava/util/ArrayList;
    invoke-static {v1}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->access$000(Lorg/openintents/openpgp/util/OpenPgpListPreference;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;

    .line 150
    .local v0, entry:Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;
    #getter for: Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->intent:Landroid/content/Intent;
    invoke-static {v0}, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->access$200(Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;)Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 160
    iget-object v1, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference$2;->this$0:Lorg/openintents/openpgp/util/OpenPgpListPreference;

    invoke-virtual {v1}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    #getter for: Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->intent:Landroid/content/Intent;
    invoke-static {v0}, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->access$200(Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 163
    :cond_0
    iget-object v1, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference$2;->this$0:Lorg/openintents/openpgp/util/OpenPgpListPreference;

    #getter for: Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->packageName:Ljava/lang/String;
    invoke-static {v0}, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->access$400(Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;)Ljava/lang/String;

    move-result-object v2

    #setter for: Lorg/openintents/openpgp/util/OpenPgpListPreference;->mSelectedPackage:Ljava/lang/String;
    invoke-static {v1, v2}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->access$302(Lorg/openintents/openpgp/util/OpenPgpListPreference;Ljava/lang/String;)Ljava/lang/String;

    .line 169
    iget-object v1, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference$2;->this$0:Lorg/openintents/openpgp/util/OpenPgpListPreference;

    const/4 v2, -0x1

    invoke-virtual {v1, p1, v2}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 170
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 171
    return-void
.end method

.class Lorg/openintents/openpgp/util/OpenPgpListPreference$1;
.super Landroid/widget/ArrayAdapter;
.source "OpenPgpListPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/openintents/openpgp/util/OpenPgpListPreference;->onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/openintents/openpgp/util/OpenPgpListPreference;


# direct methods
.method constructor <init>(Lorg/openintents/openpgp/util/OpenPgpListPreference;Landroid/content/Context;IILjava/util/List;)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter

    .prologue
    .line 125
    .local p5, x3:Ljava/util/List;,"Ljava/util/List<Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;>;"
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference$1;->this$0:Lorg/openintents/openpgp/util/OpenPgpListPreference;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;IILjava/util/List;)V

    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    const/4 v4, 0x0

    .line 128
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 129
    .local v2, v:Landroid/view/View;
    const v3, 0x1020014

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 132
    .local v1, tv:Landroid/widget/TextView;
    iget-object v3, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference$1;->this$0:Lorg/openintents/openpgp/util/OpenPgpListPreference;

    #getter for: Lorg/openintents/openpgp/util/OpenPgpListPreference;->mList:Ljava/util/ArrayList;
    invoke-static {v3}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->access$000(Lorg/openintents/openpgp/util/OpenPgpListPreference;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;

    #getter for: Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->icon:Landroid/graphics/drawable/Drawable;
    invoke-static {v3}, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->access$100(Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v1, v3, v4, v4, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 136
    const/high16 v3, 0x4120

    invoke-virtual {p0}, Lorg/openintents/openpgp/util/OpenPgpListPreference$1;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v3, v4

    const/high16 v4, 0x3f00

    add-float/2addr v3, v4

    float-to-int v0, v3

    .line 137
    .local v0, dp10:I
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 139
    return-object v2
.end method

.class public Lorg/openintents/openpgp/util/OpenPgpListPreference;
.super Landroid/preference/DialogPreference;
.source "OpenPgpListPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;
    }
.end annotation


# static fields
.field private static final MARKET_INTENT:Landroid/content/Intent; = null

.field private static final MARKET_INTENT_URI_BASE:Ljava/lang/String; = "market://details?id=%s"

.field private static final OPENKEYCHAIN_PACKAGE:Ljava/lang/String; = "org.sufficientlysecure.keychain"


# instance fields
.field private mLegacyList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;",
            ">;"
        }
    .end annotation
.end field

.field private mList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;",
            ">;"
        }
    .end annotation
.end field

.field private mSelectedPackage:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    .line 46
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    const-string v2, "market://details?id=%s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "org.sufficientlysecure.keychain"

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    sput-object v0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->MARKET_INTENT:Landroid/content/Intent;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/openintents/openpgp/util/OpenPgpListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mLegacyList:Ljava/util/ArrayList;

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mList:Ljava/util/ArrayList;

    .line 56
    return-void
.end method

.method static synthetic access$000(Lorg/openintents/openpgp/util/OpenPgpListPreference;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 43
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$302(Lorg/openintents/openpgp/util/OpenPgpListPreference;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 43
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mSelectedPackage:Ljava/lang/String;

    return-object p1
.end method

.method private getIndexOfProviderList(Ljava/lang/String;)I
    .locals 3
    .parameter "packageName"

    .prologue
    .line 193
    iget-object v2, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;

    .line 194
    .local v0, app:Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;
    #getter for: Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->packageName:Ljava/lang/String;
    invoke-static {v0}, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->access$400(Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 195
    iget-object v2, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    .line 199
    .end local v0           #app:Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;
    :goto_0
    return v2

    :cond_1
    const/4 v2, -0x1

    goto :goto_0
.end method


# virtual methods
.method public addLegacyProvider(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .parameter "position"
    .parameter "packageName"
    .parameter "simpleName"
    .parameter "icon"

    .prologue
    .line 70
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mLegacyList:Ljava/util/ArrayList;

    new-instance v1, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;

    invoke-direct {v1, p2, p3, p4}, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 71
    return-void
.end method

.method public getEntry()Ljava/lang/String;
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mSelectedPackage:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->getEntryByValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEntryByValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "packageName"

    .prologue
    .line 226
    iget-object v2, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;

    .line 227
    .local v0, app:Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;
    #getter for: Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->packageName:Ljava/lang/String;
    invoke-static {v0}, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->access$400(Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 228
    #getter for: Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->simpleName:Ljava/lang/String;
    invoke-static {v0}, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->access$500(Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;)Ljava/lang/String;

    move-result-object v2

    .line 232
    .end local v0           #app:Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;
    :goto_0
    return-object v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mSelectedPackage:Ljava/lang/String;

    return-object v0
.end method

.method protected onDialogClosed(Z)V
    .locals 1
    .parameter "positiveResult"

    .prologue
    .line 183
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onDialogClosed(Z)V

    .line 185
    if-eqz p1, :cond_0

    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mSelectedPackage:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 186
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mSelectedPackage:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 187
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mSelectedPackage:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->setValue(Ljava/lang/String;)V

    .line 190
    :cond_0
    return-void
.end method

.method protected onGetDefaultValue(Landroid/content/res/TypedArray;I)Ljava/lang/Object;
    .locals 1
    .parameter "a"
    .parameter "index"

    .prologue
    .line 217
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V
    .locals 19
    .parameter "builder"

    .prologue
    .line 75
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 78
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mList:Ljava/util/ArrayList;

    const/4 v3, 0x0

    new-instance v4, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;

    const-string v5, ""

    invoke-virtual/range {p0 .. p0}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->getContext()Landroid/content/Context;

    move-result-object v6

    sget v17, Lorg/openintents/openpgp/R$string;->openpgp_list_preference_none:I

    move/from16 v0, v17

    invoke-virtual {v6, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p0 .. p0}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->getContext()Landroid/content/Context;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    sget v18, Lorg/openintents/openpgp/R$drawable;->ic_action_cancel_launchersize:I

    invoke-virtual/range {v17 .. v18}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v4, v5, v6, v0}, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2, v3, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 83
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mList:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mLegacyList:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 86
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .local v13, providerList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;>;"
    new-instance v9, Landroid/content/Intent;

    const-string v2, "org.openintents.openpgp.IOpenPgpService"

    invoke-direct {v9, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 88
    .local v9, intent:Landroid/content/Intent;
    invoke-virtual/range {p0 .. p0}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v9, v3}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v14

    .line 89
    .local v14, resInfo:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v14}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 90
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/content/pm/ResolveInfo;

    .line 91
    .local v15, resolveInfo:Landroid/content/pm/ResolveInfo;
    iget-object v2, v15, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    if-eqz v2, :cond_0

    .line 94
    iget-object v2, v15, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v12, v2, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    .line 95
    .local v12, packageName:Ljava/lang/String;
    iget-object v2, v15, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    invoke-virtual/range {p0 .. p0}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/ServiceInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    .line 97
    .local v16, simpleName:Ljava/lang/String;
    iget-object v2, v15, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    invoke-virtual/range {p0 .. p0}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/ServiceInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 99
    .local v8, icon:Landroid/graphics/drawable/Drawable;
    new-instance v2, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;

    move-object/from16 v0, v16

    invoke-direct {v2, v12, v0, v8}, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v13, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 103
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v8           #icon:Landroid/graphics/drawable/Drawable;
    .end local v12           #packageName:Ljava/lang/String;
    .end local v15           #resolveInfo:Landroid/content/pm/ResolveInfo;
    .end local v16           #simpleName:Ljava/lang/String;
    :cond_1
    invoke-virtual {v13}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 105
    invoke-virtual/range {p0 .. p0}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    sget-object v3, Lorg/openintents/openpgp/util/OpenPgpListPreference;->MARKET_INTENT:Landroid/content/Intent;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v14

    .line 107
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .restart local v7       #i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/content/pm/ResolveInfo;

    .line 108
    .restart local v15       #resolveInfo:Landroid/content/pm/ResolveInfo;
    new-instance v10, Landroid/content/Intent;

    sget-object v2, Lorg/openintents/openpgp/util/OpenPgpListPreference;->MARKET_INTENT:Landroid/content/Intent;

    invoke-direct {v10, v2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 109
    .local v10, marketIntent:Landroid/content/Intent;
    iget-object v2, v15, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v10, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 110
    iget-object v2, v15, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    invoke-virtual/range {p0 .. p0}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/ActivityInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 111
    .restart local v8       #icon:Landroid/graphics/drawable/Drawable;
    iget-object v2, v15, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual/range {p0 .. p0}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 113
    .local v11, marketName:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lorg/openintents/openpgp/R$string;->openpgp_install_openkeychain_via:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v11, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    .line 115
    .restart local v16       #simpleName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mList:Ljava/util/ArrayList;

    new-instance v3, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;

    const-string v4, "org.sufficientlysecure.keychain"

    move-object/from16 v0, v16

    invoke-direct {v3, v4, v0, v8, v10}, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Landroid/content/Intent;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 120
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v8           #icon:Landroid/graphics/drawable/Drawable;
    .end local v10           #marketIntent:Landroid/content/Intent;
    .end local v11           #marketName:Ljava/lang/String;
    .end local v15           #resolveInfo:Landroid/content/pm/ResolveInfo;
    .end local v16           #simpleName:Ljava/lang/String;
    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2, v13}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 124
    :cond_3
    new-instance v1, Lorg/openintents/openpgp/util/OpenPgpListPreference$1;

    invoke-virtual/range {p0 .. p0}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x1090012

    const v5, 0x1020014

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mList:Ljava/util/ArrayList;

    move-object/from16 v2, p0

    invoke-direct/range {v1 .. v6}, Lorg/openintents/openpgp/util/OpenPgpListPreference$1;-><init>(Lorg/openintents/openpgp/util/OpenPgpListPreference;Landroid/content/Context;IILjava/util/List;)V

    .line 143
    .local v1, adapter:Landroid/widget/ListAdapter;
    invoke-virtual/range {p0 .. p0}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->getValue()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->getIndexOfProviderList(Ljava/lang/String;)I

    move-result v2

    new-instance v3, Lorg/openintents/openpgp/util/OpenPgpListPreference$2;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lorg/openintents/openpgp/util/OpenPgpListPreference$2;-><init>(Lorg/openintents/openpgp/util/OpenPgpListPreference;)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(Landroid/widget/ListAdapter;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 178
    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 179
    return-void
.end method

.method protected onSetInitialValue(ZLjava/lang/Object;)V
    .locals 1
    .parameter "restoreValue"
    .parameter "defaultValue"

    .prologue
    .line 222
    if-eqz p1, :cond_0

    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mSelectedPackage:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->getPersistedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .end local p2
    :goto_0
    invoke-virtual {p0, p2}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->setValue(Ljava/lang/String;)V

    .line 223
    return-void

    .line 222
    .restart local p2
    :cond_0
    check-cast p2, Ljava/lang/String;

    goto :goto_0
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .parameter "packageName"

    .prologue
    .line 203
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference;->mSelectedPackage:Ljava/lang/String;

    .line 204
    invoke-virtual {p0, p1}, Lorg/openintents/openpgp/util/OpenPgpListPreference;->persistString(Ljava/lang/String;)Z

    .line 205
    return-void
.end method

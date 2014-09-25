.class Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;
.super Ljava/lang/Object;
.source "OpenPgpListPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/openintents/openpgp/util/OpenPgpListPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OpenPgpProviderEntry"
.end annotation


# instance fields
.field private icon:Landroid/graphics/drawable/Drawable;

.field private intent:Landroid/content/Intent;

.field private packageName:Ljava/lang/String;

.field private simpleName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .parameter "packageName"
    .parameter "simpleName"
    .parameter "icon"

    .prologue
    .line 241
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 242
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->packageName:Ljava/lang/String;

    .line 243
    iput-object p2, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->simpleName:Ljava/lang/String;

    .line 244
    iput-object p3, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->icon:Landroid/graphics/drawable/Drawable;

    .line 245
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Landroid/content/Intent;)V
    .locals 0
    .parameter "packageName"
    .parameter "simpleName"
    .parameter "icon"
    .parameter "intent"

    .prologue
    .line 248
    invoke-direct {p0, p1, p2, p3}, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 249
    iput-object p4, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->intent:Landroid/content/Intent;

    .line 250
    return-void
.end method

.method static synthetic access$100(Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .parameter "x0"

    .prologue
    .line 235
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->icon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$200(Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;)Landroid/content/Intent;
    .locals 1
    .parameter "x0"

    .prologue
    .line 235
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->intent:Landroid/content/Intent;

    return-object v0
.end method

.method static synthetic access$400(Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 235
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->packageName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 235
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->simpleName:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 254
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpListPreference$OpenPgpProviderEntry;->simpleName:Ljava/lang/String;

    return-object v0
.end method

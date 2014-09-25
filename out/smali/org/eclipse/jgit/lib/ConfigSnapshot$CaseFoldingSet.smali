.class Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;
.super Ljava/util/AbstractSet;
.source "ConfigSnapshot.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/ConfigSnapshot;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CaseFoldingSet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractSet",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private final names:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Map;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 271
    .local p1, names:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    .line 272
    iput-object p1, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;->names:Ljava/util/Map;

    .line 273
    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .locals 4
    .parameter "needle"

    .prologue
    const/4 v1, 0x0

    .line 277
    instance-of v2, p1, Ljava/lang/String;

    if-eqz v2, :cond_1

    move-object v0, p1

    .line 278
    check-cast v0, Ljava/lang/String;

    .line 279
    .local v0, n:Ljava/lang/String;
    iget-object v2, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;->names:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;->names:Ljava/util/Map;

    invoke-static {v0}, Lorg/eclipse/jgit/util/StringUtils;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const/4 v1, 0x1

    .line 282
    .end local v0           #n:Ljava/lang/String;
    :cond_1
    return v1
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 287
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;->names:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 288
    .local v0, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    new-instance v1, Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet$1;

    invoke-direct {v1, p0, v0}, Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet$1;-><init>(Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;Ljava/util/Iterator;)V

    return-object v1
.end method

.method public size()I
    .locals 1

    .prologue
    .line 305
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;->names:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.class public abstract Lorg/eclipse/jgit/lib/RefDatabase;
.super Ljava/lang/Object;
.source "RefDatabase.java"


# static fields
.field public static final ALL:Ljava/lang/String; = ""

.field protected static final MAX_SYMBOLIC_REF_DEPTH:I = 0x5

.field protected static final SEARCH_PATH:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 69
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, ""

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "refs/"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "refs/tags/"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "refs/heads/"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "refs/remotes/"

    aput-object v2, v0, v1

    sput-object v0, Lorg/eclipse/jgit/lib/RefDatabase;->SEARCH_PATH:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static findRef(Ljava/util/Map;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    .locals 7
    .parameter
    .parameter "name"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lorg/eclipse/jgit/lib/Ref;"
        }
    .end annotation

    .prologue
    .line 288
    .local p0, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    sget-object v0, Lorg/eclipse/jgit/lib/RefDatabase;->SEARCH_PATH:[Ljava/lang/String;

    .local v0, arr$:[Ljava/lang/String;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v0, v2

    .line 289
    .local v4, prefix:Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 290
    .local v1, fullname:Ljava/lang/String;
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/lib/Ref;

    .line 291
    .local v5, ref:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v5, :cond_0

    .line 294
    .end local v1           #fullname:Ljava/lang/String;
    .end local v4           #prefix:Ljava/lang/String;
    .end local v5           #ref:Lorg/eclipse/jgit/lib/Ref;
    :goto_1
    return-object v5

    .line 288
    .restart local v1       #fullname:Ljava/lang/String;
    .restart local v4       #prefix:Ljava/lang/String;
    .restart local v5       #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 294
    .end local v1           #fullname:Ljava/lang/String;
    .end local v4           #prefix:Ljava/lang/String;
    .end local v5           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    const/4 v5, 0x0

    goto :goto_1
.end method


# virtual methods
.method public abstract close()V
.end method

.method public abstract create()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getAdditionalRefs()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getConflictingNames(Ljava/lang/String;)Ljava/util/Collection;
    .locals 9
    .parameter "name"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x2f

    .line 136
    const-string v7, ""

    invoke-virtual {p0, v7}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 138
    .local v0, allRefs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-virtual {p1, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    .line 139
    .local v4, lastSlash:I
    :goto_0
    if-lez v4, :cond_2

    .line 140
    const/4 v7, 0x0

    invoke-virtual {p1, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 141
    .local v5, needle:Ljava/lang/String;
    invoke-interface {v0, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 142
    invoke-static {v5}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 153
    .end local v5           #needle:Ljava/lang/String;
    :cond_0
    return-object v1

    .line 143
    .restart local v5       #needle:Ljava/lang/String;
    :cond_1
    add-int/lit8 v7, v4, -0x1

    invoke-virtual {p1, v8, v7}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v4

    .line 144
    goto :goto_0

    .line 146
    .end local v5           #needle:Ljava/lang/String;
    :cond_2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 148
    .local v1, conflicting:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 149
    .local v6, prefix:Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_3
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 150
    .local v2, existing:Ljava/lang/String;
    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 151
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public abstract getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getRefs(Ljava/lang/String;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract isNameConflicting(Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public newBatchUpdate()Lorg/eclipse/jgit/lib/BatchRefUpdate;
    .locals 1

    .prologue
    .line 196
    new-instance v0, Lorg/eclipse/jgit/lib/BatchRefUpdate;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/lib/BatchRefUpdate;-><init>(Lorg/eclipse/jgit/lib/RefDatabase;)V

    return-object v0
.end method

.method public abstract newRename(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefRename;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract newUpdate(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/RefUpdate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract peel(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public refresh()V
    .locals 0

    .prologue
    .line 273
    return-void
.end method

.class public Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;
.super Ljava/lang/Object;
.source "PathFilterGroup.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$1;,
        Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;,
        Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Single;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 181
    return-void
.end method

.method public static create(Ljava/util/Collection;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/treewalk/filter/PathFilter;",
            ">;)",
            "Lorg/eclipse/jgit/treewalk/filter/TreeFilter;"
        }
    .end annotation

    .prologue
    .line 134
    .local p0, paths:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/treewalk/filter/PathFilter;>;"
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 135
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->atLeastOnePathIsRequired:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 137
    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v1

    new-array v0, v1, [Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    .line 138
    .local v0, p:[Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    invoke-interface {p0, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 139
    invoke-static {v0}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;->create([Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v1

    return-object v1
.end method

.method private static create([Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 3
    .parameter "p"

    .prologue
    const/4 v2, 0x0

    .line 143
    array-length v0, p0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 144
    new-instance v0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Single;

    const/4 v1, 0x0

    aget-object v1, p0, v1

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Single;-><init>(Lorg/eclipse/jgit/treewalk/filter/PathFilter;Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$1;)V

    .line 145
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;

    invoke-direct {v0, p0, v2}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Group;-><init>([Lorg/eclipse/jgit/treewalk/filter/PathFilter;Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$1;)V

    goto :goto_0
.end method

.method public static createFromStrings(Ljava/util/Collection;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/eclipse/jgit/treewalk/filter/TreeFilter;"
        }
    .end annotation

    .prologue
    .line 85
    .local p0, paths:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 86
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->atLeastOnePathIsRequired:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 88
    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v5

    new-array v3, v5, [Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    .line 89
    .local v3, p:[Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    const/4 v0, 0x0

    .line 90
    .local v0, i:I
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 91
    .local v4, s:Ljava/lang/String;
    add-int/lit8 v1, v0, 0x1

    .end local v0           #i:I
    .local v1, i:I
    invoke-static {v4}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v5

    aput-object v5, v3, v0

    move v0, v1

    .end local v1           #i:I
    .restart local v0       #i:I
    goto :goto_0

    .line 92
    .end local v4           #s:Ljava/lang/String;
    :cond_1
    invoke-static {v3}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;->create([Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v5

    return-object v5
.end method

.method public static varargs createFromStrings([Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 5
    .parameter "paths"

    .prologue
    .line 112
    array-length v3, p0

    if-nez v3, :cond_0

    .line 113
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->atLeastOnePathIsRequired:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 115
    :cond_0
    array-length v1, p0

    .line 116
    .local v1, length:I
    new-array v2, v1, [Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    .line 117
    .local v2, p:[Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 118
    aget-object v3, p0, v0

    invoke-static {v3}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v3

    aput-object v3, v2, v0

    .line 117
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 119
    :cond_1
    invoke-static {v2}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;->create([Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v3

    return-object v3
.end method

.class public abstract Lorg/eclipse/jgit/revwalk/filter/OrRevFilter;
.super Lorg/eclipse/jgit/revwalk/filter/RevFilter;
.source "OrRevFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/revwalk/filter/OrRevFilter$Binary;,
        Lorg/eclipse/jgit/revwalk/filter/OrRevFilter$List;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 64
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;-><init>()V

    .line 154
    return-void
.end method

.method public static create(Ljava/util/Collection;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/revwalk/filter/RevFilter;",
            ">;)",
            "Lorg/eclipse/jgit/revwalk/filter/RevFilter;"
        }
    .end annotation

    .prologue
    .local p0, list:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/revwalk/filter/RevFilter;>;"
    const/4 v2, 0x2

    .line 107
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v1

    if-ge v1, v2, :cond_0

    .line 108
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->atLeastTwoFiltersNeeded:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 109
    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v1

    new-array v0, v1, [Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 110
    .local v0, subfilters:[Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    invoke-interface {p0, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 111
    array-length v1, v0

    if-ne v1, v2, :cond_1

    .line 112
    const/4 v1, 0x0

    aget-object v1, v0, v1

    const/4 v2, 0x1

    aget-object v2, v0, v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/revwalk/filter/OrRevFilter;->create(Lorg/eclipse/jgit/revwalk/filter/RevFilter;Lorg/eclipse/jgit/revwalk/filter/RevFilter;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v1

    .line 113
    :goto_0
    return-object v1

    :cond_1
    new-instance v1, Lorg/eclipse/jgit/revwalk/filter/OrRevFilter$List;

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/revwalk/filter/OrRevFilter$List;-><init>([Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    goto :goto_0
.end method

.method public static create(Lorg/eclipse/jgit/revwalk/filter/RevFilter;Lorg/eclipse/jgit/revwalk/filter/RevFilter;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 1
    .parameter "a"
    .parameter "b"

    .prologue
    .line 75
    sget-object v0, Lorg/eclipse/jgit/revwalk/filter/OrRevFilter;->ALL:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    if-eq p0, v0, :cond_0

    sget-object v0, Lorg/eclipse/jgit/revwalk/filter/OrRevFilter;->ALL:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    if-ne p1, v0, :cond_1

    .line 76
    :cond_0
    sget-object v0, Lorg/eclipse/jgit/revwalk/filter/OrRevFilter;->ALL:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 77
    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/OrRevFilter$Binary;

    invoke-direct {v0, p0, p1}, Lorg/eclipse/jgit/revwalk/filter/OrRevFilter$Binary;-><init>(Lorg/eclipse/jgit/revwalk/filter/RevFilter;Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    goto :goto_0
.end method

.method public static create([Lorg/eclipse/jgit/revwalk/filter/RevFilter;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 4
    .parameter "list"

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x0

    .line 89
    array-length v1, p0

    if-ne v1, v3, :cond_0

    .line 90
    aget-object v1, p0, v2

    const/4 v2, 0x1

    aget-object v2, p0, v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/revwalk/filter/OrRevFilter;->create(Lorg/eclipse/jgit/revwalk/filter/RevFilter;Lorg/eclipse/jgit/revwalk/filter/RevFilter;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v1

    .line 95
    :goto_0
    return-object v1

    .line 91
    :cond_0
    array-length v1, p0

    if-ge v1, v3, :cond_1

    .line 92
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->atLeastTwoFiltersNeeded:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 93
    :cond_1
    array-length v1, p0

    new-array v0, v1, [Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 94
    .local v0, subfilters:[Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 95
    new-instance v1, Lorg/eclipse/jgit/revwalk/filter/OrRevFilter$List;

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/revwalk/filter/OrRevFilter$List;-><init>([Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    goto :goto_0
.end method

.class public Lorg/eclipse/jgit/treewalk/filter/TreeFilterMarker;
.super Ljava/lang/Object;
.source "TreeFilterMarker.java"


# instance fields
.field private final filters:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;


# direct methods
.method public constructor <init>([Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V
    .locals 5
    .parameter "markTreeFilters"

    .prologue
    const/16 v3, 0x20

    const/4 v4, 0x0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    array-length v0, p1

    if-le v0, v3, :cond_0

    .line 77
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->treeFilterMarkerTooManyFilters:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/4 v3, 0x1

    array-length v4, p1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_0
    array-length v0, p1

    new-array v0, v0, [Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/TreeFilterMarker;->filters:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 83
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/TreeFilterMarker;->filters:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    array-length v1, p1

    invoke-static {p1, v4, v0, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 84
    return-void
.end method


# virtual methods
.method public getMarks(Lorg/eclipse/jgit/treewalk/TreeWalk;)I
    .locals 9
    .parameter "walk"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 104
    const/4 v4, 0x0

    .line 105
    .local v4, marks:I
    const/4 v2, 0x0

    .local v2, index:I
    :goto_0
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/filter/TreeFilterMarker;->filters:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    array-length v5, v5

    if-ge v2, v5, :cond_1

    .line 106
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/filter/TreeFilterMarker;->filters:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    aget-object v1, v5, v2

    .line 107
    .local v1, filter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    if-eqz v1, :cond_0

    .line 109
    :try_start_0
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/StopWalkException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 110
    .local v3, marked:Z
    if-eqz v3, :cond_0

    .line 111
    int-to-long v5, v4

    const-wide/16 v7, 0x1

    shl-long/2addr v7, v2

    or-long/2addr v5, v7

    long-to-int v4, v5

    .line 105
    .end local v3           #marked:Z
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 112
    :catch_0
    move-exception v0

    .line 115
    .local v0, e:Lorg/eclipse/jgit/errors/StopWalkException;
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/filter/TreeFilterMarker;->filters:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    const/4 v6, 0x0

    aput-object v6, v5, v2

    goto :goto_1

    .line 119
    .end local v0           #e:Lorg/eclipse/jgit/errors/StopWalkException;
    .end local v1           #filter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    :cond_1
    return v4
.end method

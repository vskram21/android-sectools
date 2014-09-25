.class final Lorg/eclipse/jgit/treewalk/filter/TreeFilter$AnyDiffFilter;
.super Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.source "TreeFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AnyDiffFilter"
.end annotation


# static fields
.field private static final baseTree:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 131
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/treewalk/filter/TreeFilter$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 131
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter$AnyDiffFilter;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 131
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter$AnyDiffFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 0

    .prologue
    .line 154
    return-object p0
.end method

.method public include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .locals 6
    .parameter "walker"

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 136
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTreeCount()I

    move-result v2

    .line 137
    .local v2, n:I
    if-ne v2, v3, :cond_1

    .line 144
    :cond_0
    :goto_0
    return v3

    .line 140
    :cond_1
    invoke-virtual {p1, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v1

    .line 141
    .local v1, m:I
    const/4 v0, 0x1

    .local v0, i:I
    :goto_1
    if-ge v0, v2, :cond_2

    .line 142
    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v5

    if-ne v5, v1, :cond_0

    invoke-virtual {p1, v0, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->idEqual(II)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 141
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    move v3, v4

    .line 144
    goto :goto_0
.end method

.method public shouldBeRecursive()Z
    .locals 1

    .prologue
    .line 149
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 159
    const-string v0, "ANY_DIFF"

    return-object v0
.end method

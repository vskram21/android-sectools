.class final Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$1;
.super Ljava/lang/Object;
.source "WorkingTreeIterator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 606
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 606
    check-cast p1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$1;->compare(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)I
    .locals 8
    .parameter "o1"
    .parameter "o2"

    .prologue
    .line 608
    iget-object v0, p1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->encodedName:[B

    .line 609
    .local v0, a:[B
    iget-object v2, p2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->encodedName:[B

    .line 610
    .local v2, b:[B
    iget v1, p1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->encodedNameLen:I

    .line 611
    .local v1, aLen:I
    iget v3, p2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->encodedNameLen:I

    .line 614
    .local v3, bLen:I
    const/4 v4, 0x0

    .local v4, cPos:I
    :goto_0
    if-ge v4, v1, :cond_1

    if-ge v4, v3, :cond_1

    .line 615
    aget-byte v6, v0, v4

    and-int/lit16 v6, v6, 0xff

    aget-byte v7, v2, v4

    and-int/lit16 v7, v7, 0xff

    sub-int v5, v6, v7

    .line 616
    .local v5, cmp:I
    if-eqz v5, :cond_0

    .line 624
    .end local v5           #cmp:I
    :goto_1
    return v5

    .line 614
    .restart local v5       #cmp:I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 620
    .end local v5           #cmp:I
    :cond_1
    if-ge v4, v1, :cond_2

    .line 621
    aget-byte v6, v0, v4

    and-int/lit16 v6, v6, 0xff

    invoke-static {p2}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->lastPathChar(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)I

    move-result v7

    sub-int v5, v6, v7

    goto :goto_1

    .line 622
    :cond_2
    if-ge v4, v3, :cond_3

    .line 623
    invoke-static {p1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->lastPathChar(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)I

    move-result v6

    aget-byte v7, v2, v4

    and-int/lit16 v7, v7, 0xff

    sub-int v5, v6, v7

    goto :goto_1

    .line 624
    :cond_3
    invoke-static {p1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->lastPathChar(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)I

    move-result v6

    invoke-static {p2}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->lastPathChar(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;)I

    move-result v7

    sub-int v5, v6, v7

    goto :goto_1
.end method

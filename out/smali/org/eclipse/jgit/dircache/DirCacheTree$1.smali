.class final Lorg/eclipse/jgit/dircache/DirCacheTree$1;
.super Ljava/lang/Object;
.source "DirCacheTree.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/dircache/DirCacheTree;
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
        "Lorg/eclipse/jgit/dircache/DirCacheTree;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 82
    check-cast p1, Lorg/eclipse/jgit/dircache/DirCacheTree;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/dircache/DirCacheTree;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/dircache/DirCacheTree$1;->compare(Lorg/eclipse/jgit/dircache/DirCacheTree;Lorg/eclipse/jgit/dircache/DirCacheTree;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/dircache/DirCacheTree;Lorg/eclipse/jgit/dircache/DirCacheTree;)I
    .locals 8
    .parameter "o1"
    .parameter "o2"

    .prologue
    .line 84
    #getter for: Lorg/eclipse/jgit/dircache/DirCacheTree;->encodedName:[B
    invoke-static {p1}, Lorg/eclipse/jgit/dircache/DirCacheTree;->access$000(Lorg/eclipse/jgit/dircache/DirCacheTree;)[B

    move-result-object v0

    .line 85
    .local v0, a:[B
    #getter for: Lorg/eclipse/jgit/dircache/DirCacheTree;->encodedName:[B
    invoke-static {p2}, Lorg/eclipse/jgit/dircache/DirCacheTree;->access$000(Lorg/eclipse/jgit/dircache/DirCacheTree;)[B

    move-result-object v2

    .line 86
    .local v2, b:[B
    array-length v1, v0

    .line 87
    .local v1, aLen:I
    array-length v3, v2

    .line 89
    .local v3, bLen:I
    const/4 v4, 0x0

    .local v4, cPos:I
    :goto_0
    if-ge v4, v1, :cond_1

    if-ge v4, v3, :cond_1

    .line 90
    aget-byte v6, v0, v4

    and-int/lit16 v6, v6, 0xff

    aget-byte v7, v2, v4

    and-int/lit16 v7, v7, 0xff

    sub-int v5, v6, v7

    .line 91
    .local v5, cmp:I
    if-eqz v5, :cond_0

    .line 98
    .end local v5           #cmp:I
    :goto_1
    return v5

    .line 89
    .restart local v5       #cmp:I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 94
    .end local v5           #cmp:I
    :cond_1
    if-ne v1, v3, :cond_2

    .line 95
    const/4 v5, 0x0

    goto :goto_1

    .line 96
    :cond_2
    if-ge v1, v3, :cond_3

    .line 97
    aget-byte v6, v2, v4

    and-int/lit16 v6, v6, 0xff

    rsub-int/lit8 v5, v6, 0x2f

    goto :goto_1

    .line 98
    :cond_3
    aget-byte v6, v0, v4

    and-int/lit16 v6, v6, 0xff

    add-int/lit8 v5, v6, -0x2f

    goto :goto_1
.end method

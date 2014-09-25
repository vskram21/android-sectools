.class final Lorg/eclipse/jgit/dircache/DirCacheEditor$1;
.super Ljava/lang/Object;
.source "DirCacheEditor.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/dircache/DirCacheEditor;
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
        "Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 71
    check-cast p1, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/dircache/DirCacheEditor$1;->compare(Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;)I
    .locals 4
    .parameter "o1"
    .parameter "o2"

    .prologue
    .line 73
    iget-object v0, p1, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;->path:[B

    .line 74
    .local v0, a:[B
    iget-object v1, p2, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;->path:[B

    .line 75
    .local v1, b:[B
    array-length v2, v0

    array-length v3, v1

    invoke-static {v0, v2, v1, v3}, Lorg/eclipse/jgit/dircache/DirCache;->cmp([BI[BI)I

    move-result v2

    return v2
.end method

.class final Lorg/eclipse/jgit/dircache/DirCache$1;
.super Ljava/lang/Object;
.source "DirCache.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/dircache/DirCache;
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
        "Lorg/eclipse/jgit/dircache/DirCacheEntry;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 109
    check-cast p1, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/dircache/DirCache$1;->compare(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/dircache/DirCacheEntry;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/dircache/DirCacheEntry;)I
    .locals 3
    .parameter "o1"
    .parameter "o2"

    .prologue
    .line 111
    invoke-static {p1, p2}, Lorg/eclipse/jgit/dircache/DirCache;->cmp(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/dircache/DirCacheEntry;)I

    move-result v0

    .line 112
    .local v0, cr:I
    if-eqz v0, :cond_0

    .line 114
    .end local v0           #cr:I
    :goto_0
    return v0

    .restart local v0       #cr:I
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getStage()I

    move-result v1

    invoke-virtual {p2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getStage()I

    move-result v2

    sub-int v0, v1, v2

    goto :goto_0
.end method

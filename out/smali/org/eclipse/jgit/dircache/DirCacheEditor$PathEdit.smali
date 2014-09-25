.class public abstract Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;
.super Ljava/lang/Object;
.source "DirCacheEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/dircache/DirCacheEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "PathEdit"
.end annotation


# instance fields
.field final path:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "entryPath"

    .prologue
    .line 189
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 190
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;->path:[B

    .line 191
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    .locals 1
    .parameter "ent"

    .prologue
    .line 200
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 201
    iget-object v0, p1, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;->path:[B

    .line 202
    return-void
.end method


# virtual methods
.method public abstract apply(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
.end method

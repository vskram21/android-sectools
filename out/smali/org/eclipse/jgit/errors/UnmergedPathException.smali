.class public Lorg/eclipse/jgit/errors/UnmergedPathException;
.super Ljava/io/IOException;
.source "UnmergedPathException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    .locals 4
    .parameter "dce"

    .prologue
    .line 67
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->unmergedPath:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getPathString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 68
    iput-object p1, p0, Lorg/eclipse/jgit/errors/UnmergedPathException;->entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 69
    return-void
.end method


# virtual methods
.method public getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lorg/eclipse/jgit/errors/UnmergedPathException;->entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;

    return-object v0
.end method

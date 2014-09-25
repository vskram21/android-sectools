.class public final Lorg/eclipse/jgit/dircache/DirCacheEditor$DeletePath;
.super Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;
.source "DirCacheEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/dircache/DirCacheEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DeletePath"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "entryPath"

    .prologue
    .line 234
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;-><init>(Ljava/lang/String;)V

    .line 235
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    .locals 0
    .parameter "ent"

    .prologue
    .line 245
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;-><init>(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 246
    return-void
.end method


# virtual methods
.method public apply(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    .locals 2
    .parameter "ent"

    .prologue
    .line 249
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->noApplyInDelete:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

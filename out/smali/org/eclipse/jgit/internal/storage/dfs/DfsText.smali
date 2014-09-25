.class public Lorg/eclipse/jgit/internal/storage/dfs/DfsText;
.super Lorg/eclipse/jgit/nls/TranslationBundle;
.source "DfsText.java"


# instance fields
.field public cannotReadIndex:Ljava/lang/String;

.field public shortReadOfBlock:Ljava/lang/String;

.field public shortReadOfIndex:Ljava/lang/String;

.field public willNotStoreEmptyPack:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/eclipse/jgit/nls/TranslationBundle;-><init>()V

    return-void
.end method

.method public static get()Lorg/eclipse/jgit/internal/storage/dfs/DfsText;
    .locals 1

    .prologue
    .line 53
    const-class v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsText;

    invoke-static {v0}, Lorg/eclipse/jgit/nls/NLS;->getBundleFor(Ljava/lang/Class;)Lorg/eclipse/jgit/nls/TranslationBundle;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsText;

    return-object v0
.end method

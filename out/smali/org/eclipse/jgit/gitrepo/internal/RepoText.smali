.class public Lorg/eclipse/jgit/gitrepo/internal/RepoText;
.super Lorg/eclipse/jgit/nls/TranslationBundle;
.source "RepoText.java"


# instance fields
.field public copyFileFailed:Ljava/lang/String;

.field public errorNoDefault:Ljava/lang/String;

.field public errorParsingManifestFile:Ljava/lang/String;

.field public errorRemoteUnavailable:Ljava/lang/String;

.field public invalidManifest:Ljava/lang/String;

.field public repoCommitMessage:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Lorg/eclipse/jgit/nls/TranslationBundle;-><init>()V

    return-void
.end method

.method public static get()Lorg/eclipse/jgit/gitrepo/internal/RepoText;
    .locals 1

    .prologue
    .line 58
    const-class v0, Lorg/eclipse/jgit/gitrepo/internal/RepoText;

    invoke-static {v0}, Lorg/eclipse/jgit/nls/NLS;->getBundleFor(Ljava/lang/Class;)Lorg/eclipse/jgit/nls/TranslationBundle;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/gitrepo/internal/RepoText;

    return-object v0
.end method

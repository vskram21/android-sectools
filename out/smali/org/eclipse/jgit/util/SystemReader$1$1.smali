.class Lorg/eclipse/jgit/util/SystemReader$1$1;
.super Lorg/eclipse/jgit/storage/file/FileBasedConfig;
.source "SystemReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/util/SystemReader$1;->openSystemConfig(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/storage/file/FileBasedConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/util/SystemReader$1;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/util/SystemReader$1;Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 85
    iput-object p1, p0, Lorg/eclipse/jgit/util/SystemReader$1$1;->this$0:Lorg/eclipse/jgit/util/SystemReader$1;

    invoke-direct {p0, p2, p3}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    return-void
.end method


# virtual methods
.method public isOutdated()Z
    .locals 1

    .prologue
    .line 92
    const/4 v0, 0x0

    return v0
.end method

.method public load()V
    .locals 0

    .prologue
    .line 88
    return-void
.end method

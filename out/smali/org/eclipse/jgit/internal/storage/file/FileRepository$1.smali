.class Lorg/eclipse/jgit/internal/storage/file/FileRepository$1;
.super Lorg/eclipse/jgit/storage/file/FileBasedConfig;
.source "FileRepository.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/file/FileRepository;-><init>(Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/file/FileRepository;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/FileRepository;Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 173
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository$1;->this$0:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-direct {p0, p2, p3}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    return-void
.end method


# virtual methods
.method public isOutdated()Z
    .locals 1

    .prologue
    .line 180
    const/4 v0, 0x0

    return v0
.end method

.method public load()V
    .locals 0

    .prologue
    .line 176
    return-void
.end method

.class Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateRepository;
.super Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
.source "ObjectDirectory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AlternateRepository"
.end annotation


# instance fields
.field final repository:Lorg/eclipse/jgit/internal/storage/file/FileRepository;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/FileRepository;)V
    .locals 1
    .parameter "r"

    .prologue
    .line 912
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;-><init>(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;)V

    .line 913
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateRepository;->repository:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    .line 914
    return-void
.end method


# virtual methods
.method close()V
    .locals 1

    .prologue
    .line 917
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateRepository;->repository:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->close()V

    .line 918
    return-void
.end method

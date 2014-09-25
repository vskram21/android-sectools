.class final Lorg/eclipse/jgit/internal/storage/file/FileSnapshot$1;
.super Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
.source "FileSnapshot.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>(JJ)V
    .locals 6
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 83
    const/4 v5, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;-><init>(JJLorg/eclipse/jgit/internal/storage/file/FileSnapshot$1;)V

    return-void
.end method


# virtual methods
.method public isModified(Ljava/io/File;)Z
    .locals 1
    .parameter "path"

    .prologue
    .line 86
    sget-object v0, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/util/FS;->exists(Ljava/io/File;)Z

    move-result v0

    return v0
.end method

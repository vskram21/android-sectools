.class final Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
.super Ljava/lang/Object;
.source "ObjectDirectory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PackList"
.end annotation


# instance fields
.field final packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

.field final snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;[Lorg/eclipse/jgit/internal/storage/file/PackFile;)V
    .locals 0
    .parameter "monitor"
    .parameter "packs"

    .prologue
    .line 890
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 891
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 892
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 893
    return-void
.end method

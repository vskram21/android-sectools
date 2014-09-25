.class Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
.super Ljava/lang/Object;
.source "ObjectDirectory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AlternateHandle"
.end annotation


# instance fields
.field final db:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;)V
    .locals 0
    .parameter "db"

    .prologue
    .line 899
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 900
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;->db:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    .line 901
    return-void
.end method


# virtual methods
.method close()V
    .locals 1

    .prologue
    .line 904
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;->db:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->close()V

    .line 905
    return-void
.end method

.class Lorg/eclipse/jgit/internal/storage/file/FileRepository$2;
.super Ljava/lang/Object;
.source "FileRepository.java"

# interfaces
.implements Lorg/eclipse/jgit/events/ConfigChangedListener;


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
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/FileRepository;)V
    .locals 0
    .parameter

    .prologue
    .line 193
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository$2;->this$0:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfigChanged(Lorg/eclipse/jgit/events/ConfigChangedEvent;)V
    .locals 1
    .parameter "event"

    .prologue
    .line 195
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository$2;->this$0:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->fireEvent(Lorg/eclipse/jgit/events/RepositoryEvent;)V

    .line 196
    return-void
.end method

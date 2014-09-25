.class Lorg/eclipse/jgit/transport/WalkPushConnection$1;
.super Lorg/eclipse/jgit/lib/RefWriter;
.source "WalkPushConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/WalkPushConnection;->push(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Map;Ljava/io/OutputStream;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/WalkPushConnection;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/WalkPushConnection;Ljava/util/Collection;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 185
    .local p2, x0:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/transport/WalkPushConnection$1;->this$0:Lorg/eclipse/jgit/transport/WalkPushConnection;

    invoke-direct {p0, p2}, Lorg/eclipse/jgit/lib/RefWriter;-><init>(Ljava/util/Collection;)V

    return-void
.end method


# virtual methods
.method protected writeFile(Ljava/lang/String;[B)V
    .locals 3
    .parameter "file"
    .parameter "content"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 189
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkPushConnection$1;->this$0:Lorg/eclipse/jgit/transport/WalkPushConnection;

    #getter for: Lorg/eclipse/jgit/transport/WalkPushConnection;->dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    invoke-static {v0}, Lorg/eclipse/jgit/transport/WalkPushConnection;->access$000(Lorg/eclipse/jgit/transport/WalkPushConnection;)Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "../"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->writeFile(Ljava/lang/String;[B)V

    .line 190
    return-void
.end method

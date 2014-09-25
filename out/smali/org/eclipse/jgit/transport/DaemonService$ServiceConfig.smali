.class Lorg/eclipse/jgit/transport/DaemonService$ServiceConfig;
.super Ljava/lang/Object;
.source "DaemonService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/DaemonService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ServiceConfig"
.end annotation


# instance fields
.field final enabled:Z


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/DaemonService;Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V
    .locals 2
    .parameter "service"
    .parameter "cfg"
    .parameter "name"

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    const-string v0, "daemon"

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/DaemonService;->isEnabled()Z

    move-result v1

    invoke-virtual {p2, v0, p3, v1}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/DaemonService$ServiceConfig;->enabled:Z

    .line 81
    return-void
.end method

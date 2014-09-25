.class Lorg/eclipse/jgit/transport/DaemonService$1;
.super Ljava/lang/Object;
.source "DaemonService.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/Config$SectionParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/DaemonService;-><init>(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/eclipse/jgit/lib/Config$SectionParser",
        "<",
        "Lorg/eclipse/jgit/transport/DaemonService$ServiceConfig;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/DaemonService;

.field final synthetic val$cfgName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/DaemonService;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 67
    iput-object p1, p0, Lorg/eclipse/jgit/transport/DaemonService$1;->this$0:Lorg/eclipse/jgit/transport/DaemonService;

    iput-object p2, p0, Lorg/eclipse/jgit/transport/DaemonService$1;->val$cfgName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic parse(Lorg/eclipse/jgit/lib/Config;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/transport/DaemonService$1;->parse(Lorg/eclipse/jgit/lib/Config;)Lorg/eclipse/jgit/transport/DaemonService$ServiceConfig;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/eclipse/jgit/lib/Config;)Lorg/eclipse/jgit/transport/DaemonService$ServiceConfig;
    .locals 3
    .parameter "cfg"

    .prologue
    .line 69
    new-instance v0, Lorg/eclipse/jgit/transport/DaemonService$ServiceConfig;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/DaemonService$1;->this$0:Lorg/eclipse/jgit/transport/DaemonService;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/DaemonService$1;->val$cfgName:Ljava/lang/String;

    invoke-direct {v0, v1, p1, v2}, Lorg/eclipse/jgit/transport/DaemonService$ServiceConfig;-><init>(Lorg/eclipse/jgit/transport/DaemonService;Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V

    return-object v0
.end method

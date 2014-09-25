.class public abstract Lorg/eclipse/jgit/transport/DaemonService;
.super Ljava/lang/Object;
.source "DaemonService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/DaemonService$ServiceConfig;
    }
.end annotation


# instance fields
.field private final command:Ljava/lang/String;

.field private final configKey:Lorg/eclipse/jgit/lib/Config$SectionParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/Config$SectionParser",
            "<",
            "Lorg/eclipse/jgit/transport/DaemonService$ServiceConfig;",
            ">;"
        }
    .end annotation
.end field

.field private enabled:Z

.field private overridable:Z


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "cmdName"
    .parameter "cfgName"

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const-string v0, "git-"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .end local p1
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/transport/DaemonService;->command:Ljava/lang/String;

    .line 67
    new-instance v0, Lorg/eclipse/jgit/transport/DaemonService$1;

    invoke-direct {v0, p0, p2}, Lorg/eclipse/jgit/transport/DaemonService$1;-><init>(Lorg/eclipse/jgit/transport/DaemonService;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/DaemonService;->configKey:Lorg/eclipse/jgit/lib/Config$SectionParser;

    .line 72
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/DaemonService;->overridable:Z

    .line 73
    return-void

    .line 66
    .restart local p1
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "git-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private isEnabledFor(Lorg/eclipse/jgit/lib/Repository;)Z
    .locals 2
    .parameter "db"

    .prologue
    .line 154
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/DaemonService;->isOverridable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 155
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/DaemonService;->configKey:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/DaemonService$ServiceConfig;

    iget-boolean v0, v0, Lorg/eclipse/jgit/transport/DaemonService$ServiceConfig;->enabled:Z

    .line 156
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/DaemonService;->isEnabled()Z

    move-result v0

    goto :goto_0
.end method


# virtual methods
.method execute(Lorg/eclipse/jgit/transport/DaemonClient;Ljava/lang/String;)V
    .locals 6
    .parameter "client"
    .parameter "commandLine"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;,
            Lorg/eclipse/jgit/transport/resolver/ServiceNotAuthorizedException;
        }
    .end annotation

    .prologue
    .line 132
    iget-object v4, p0, Lorg/eclipse/jgit/transport/DaemonService;->command:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 135
    .local v2, name:Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/DaemonClient;->getDaemon()Lorg/eclipse/jgit/transport/Daemon;

    move-result-object v4

    invoke-virtual {v4, p1, v2}, Lorg/eclipse/jgit/transport/Daemon;->openRepository(Lorg/eclipse/jgit/transport/DaemonClient;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Repository;
    :try_end_0
    .catch Lorg/eclipse/jgit/transport/ServiceMayNotContinueException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 143
    .local v0, db:Lorg/eclipse/jgit/lib/Repository;
    :goto_0
    if-nez v0, :cond_0

    .line 151
    :goto_1
    return-void

    .line 136
    .end local v0           #db:Lorg/eclipse/jgit/lib/Repository;
    :catch_0
    move-exception v1

    .line 139
    .local v1, e:Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
    new-instance v3, Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/DaemonClient;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/transport/PacketLineOut;-><init>(Ljava/io/OutputStream;)V

    .line 140
    .local v3, pktOut:Lorg/eclipse/jgit/transport/PacketLineOut;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ERR "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    .line 141
    const/4 v0, 0x0

    .restart local v0       #db:Lorg/eclipse/jgit/lib/Repository;
    goto :goto_0

    .line 146
    .end local v1           #e:Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
    .end local v3           #pktOut:Lorg/eclipse/jgit/transport/PacketLineOut;
    :cond_0
    :try_start_1
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/DaemonService;->isEnabledFor(Lorg/eclipse/jgit/lib/Repository;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 147
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/transport/DaemonService;->execute(Lorg/eclipse/jgit/transport/DaemonClient;Lorg/eclipse/jgit/lib/Repository;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 149
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->close()V

    goto :goto_1

    :catchall_0
    move-exception v4

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->close()V

    throw v4
.end method

.method abstract execute(Lorg/eclipse/jgit/transport/DaemonClient;Lorg/eclipse/jgit/lib/Repository;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;,
            Lorg/eclipse/jgit/transport/resolver/ServiceNotAuthorizedException;
        }
    .end annotation
.end method

.method public getCommandName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lorg/eclipse/jgit/transport/DaemonService;->command:Ljava/lang/String;

    return-object v0
.end method

.method public handles(Ljava/lang/String;)Z
    .locals 2
    .parameter "commandLine"

    .prologue
    .line 124
    iget-object v0, p0, Lorg/eclipse/jgit/transport/DaemonService;->command:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/transport/DaemonService;->command:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x20

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/transport/DaemonService;->command:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEnabled()Z
    .locals 1

    .prologue
    .line 86
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/DaemonService;->enabled:Z

    return v0
.end method

.method public isOverridable()Z
    .locals 1

    .prologue
    .line 99
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/DaemonService;->overridable:Z

    return v0
.end method

.method public setEnabled(Z)V
    .locals 0
    .parameter "on"

    .prologue
    .line 94
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/DaemonService;->enabled:Z

    .line 95
    return-void
.end method

.method public setOverridable(Z)V
    .locals 0
    .parameter "on"

    .prologue
    .line 108
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/DaemonService;->overridable:Z

    .line 109
    return-void
.end method

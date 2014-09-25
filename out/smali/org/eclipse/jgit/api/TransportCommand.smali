.class public abstract Lorg/eclipse/jgit/api/TransportCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "TransportCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C:",
        "Lorg/eclipse/jgit/api/GitCommand;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/eclipse/jgit/api/GitCommand",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected credentialsProvider:Lorg/eclipse/jgit/transport/CredentialsProvider;

.field protected timeout:I

.field protected transportConfigCallback:Lorg/eclipse/jgit/api/TransportConfigCallback;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter "repo"

    .prologue
    .line 81
    .local p0, this:Lorg/eclipse/jgit/api/TransportCommand;,"Lorg/eclipse/jgit/api/TransportCommand<TC;TT;>;"
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 82
    return-void
.end method


# virtual methods
.method protected configure(Lorg/eclipse/jgit/api/TransportCommand;)Lorg/eclipse/jgit/api/GitCommand;
    .locals 1
    .parameter "childCommand"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/api/TransportCommand;",
            ")TC;"
        }
    .end annotation

    .prologue
    .line 150
    .local p0, this:Lorg/eclipse/jgit/api/TransportCommand;,"Lorg/eclipse/jgit/api/TransportCommand<TC;TT;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/api/TransportCommand;->credentialsProvider:Lorg/eclipse/jgit/transport/CredentialsProvider;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/api/TransportCommand;->setCredentialsProvider(Lorg/eclipse/jgit/transport/CredentialsProvider;)Lorg/eclipse/jgit/api/GitCommand;

    .line 151
    iget v0, p0, Lorg/eclipse/jgit/api/TransportCommand;->timeout:I

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/api/TransportCommand;->setTimeout(I)Lorg/eclipse/jgit/api/GitCommand;

    .line 152
    iget-object v0, p0, Lorg/eclipse/jgit/api/TransportCommand;->transportConfigCallback:Lorg/eclipse/jgit/api/TransportConfigCallback;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/api/TransportCommand;->setTransportConfigCallback(Lorg/eclipse/jgit/api/TransportConfigCallback;)Lorg/eclipse/jgit/api/GitCommand;

    .line 153
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/TransportCommand;->self()Lorg/eclipse/jgit/api/GitCommand;

    move-result-object v0

    return-object v0
.end method

.method protected configure(Lorg/eclipse/jgit/transport/Transport;)Lorg/eclipse/jgit/api/GitCommand;
    .locals 1
    .parameter "transport"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/Transport;",
            ")TC;"
        }
    .end annotation

    .prologue
    .line 134
    .local p0, this:Lorg/eclipse/jgit/api/TransportCommand;,"Lorg/eclipse/jgit/api/TransportCommand<TC;TT;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/api/TransportCommand;->credentialsProvider:Lorg/eclipse/jgit/transport/CredentialsProvider;

    if-eqz v0, :cond_0

    .line 135
    iget-object v0, p0, Lorg/eclipse/jgit/api/TransportCommand;->credentialsProvider:Lorg/eclipse/jgit/transport/CredentialsProvider;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/transport/Transport;->setCredentialsProvider(Lorg/eclipse/jgit/transport/CredentialsProvider;)V

    .line 136
    :cond_0
    iget v0, p0, Lorg/eclipse/jgit/api/TransportCommand;->timeout:I

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/transport/Transport;->setTimeout(I)V

    .line 137
    iget-object v0, p0, Lorg/eclipse/jgit/api/TransportCommand;->transportConfigCallback:Lorg/eclipse/jgit/api/TransportConfigCallback;

    if-eqz v0, :cond_1

    .line 138
    iget-object v0, p0, Lorg/eclipse/jgit/api/TransportCommand;->transportConfigCallback:Lorg/eclipse/jgit/api/TransportConfigCallback;

    invoke-interface {v0, p1}, Lorg/eclipse/jgit/api/TransportConfigCallback;->configure(Lorg/eclipse/jgit/transport/Transport;)V

    .line 139
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/TransportCommand;->self()Lorg/eclipse/jgit/api/GitCommand;

    move-result-object v0

    return-object v0
.end method

.method protected final self()Lorg/eclipse/jgit/api/GitCommand;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TC;"
        }
    .end annotation

    .prologue
    .line 123
    .local p0, this:Lorg/eclipse/jgit/api/TransportCommand;,"Lorg/eclipse/jgit/api/TransportCommand<TC;TT;>;"
    return-object p0
.end method

.method public setCredentialsProvider(Lorg/eclipse/jgit/transport/CredentialsProvider;)Lorg/eclipse/jgit/api/GitCommand;
    .locals 1
    .parameter "credentialsProvider"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/CredentialsProvider;",
            ")TC;"
        }
    .end annotation

    .prologue
    .line 91
    .local p0, this:Lorg/eclipse/jgit/api/TransportCommand;,"Lorg/eclipse/jgit/api/TransportCommand<TC;TT;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/api/TransportCommand;->credentialsProvider:Lorg/eclipse/jgit/transport/CredentialsProvider;

    .line 92
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/TransportCommand;->self()Lorg/eclipse/jgit/api/GitCommand;

    move-result-object v0

    return-object v0
.end method

.method public setTimeout(I)Lorg/eclipse/jgit/api/GitCommand;
    .locals 1
    .parameter "timeout"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TC;"
        }
    .end annotation

    .prologue
    .line 101
    .local p0, this:Lorg/eclipse/jgit/api/TransportCommand;,"Lorg/eclipse/jgit/api/TransportCommand<TC;TT;>;"
    iput p1, p0, Lorg/eclipse/jgit/api/TransportCommand;->timeout:I

    .line 102
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/TransportCommand;->self()Lorg/eclipse/jgit/api/GitCommand;

    move-result-object v0

    return-object v0
.end method

.method public setTransportConfigCallback(Lorg/eclipse/jgit/api/TransportConfigCallback;)Lorg/eclipse/jgit/api/GitCommand;
    .locals 1
    .parameter "transportConfigCallback"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/api/TransportConfigCallback;",
            ")TC;"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, this:Lorg/eclipse/jgit/api/TransportCommand;,"Lorg/eclipse/jgit/api/TransportCommand<TC;TT;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/api/TransportCommand;->transportConfigCallback:Lorg/eclipse/jgit/api/TransportConfigCallback;

    .line 117
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/TransportCommand;->self()Lorg/eclipse/jgit/api/GitCommand;

    move-result-object v0

    return-object v0
.end method

.class public abstract Lorg/eclipse/jgit/transport/SshSessionFactory;
.super Ljava/lang/Object;
.source "SshSessionFactory.java"


# static fields
.field private static INSTANCE:Lorg/eclipse/jgit/transport/SshSessionFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    new-instance v0, Lorg/eclipse/jgit/transport/DefaultSshSessionFactory;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/DefaultSshSessionFactory;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/SshSessionFactory;->INSTANCE:Lorg/eclipse/jgit/transport/SshSessionFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lorg/eclipse/jgit/transport/SshSessionFactory;
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lorg/eclipse/jgit/transport/SshSessionFactory;->INSTANCE:Lorg/eclipse/jgit/transport/SshSessionFactory;

    return-object v0
.end method

.method public static setInstance(Lorg/eclipse/jgit/transport/SshSessionFactory;)V
    .locals 1
    .parameter "newFactory"

    .prologue
    .line 84
    if-eqz p0, :cond_0

    .line 85
    sput-object p0, Lorg/eclipse/jgit/transport/SshSessionFactory;->INSTANCE:Lorg/eclipse/jgit/transport/SshSessionFactory;

    .line 88
    :goto_0
    return-void

    .line 87
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/transport/DefaultSshSessionFactory;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/DefaultSshSessionFactory;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/SshSessionFactory;->INSTANCE:Lorg/eclipse/jgit/transport/SshSessionFactory;

    goto :goto_0
.end method


# virtual methods
.method public abstract getSession(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/transport/CredentialsProvider;Lorg/eclipse/jgit/util/FS;I)Lorg/eclipse/jgit/transport/RemoteSession;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation
.end method

.method public releaseSession(Lorg/eclipse/jgit/transport/RemoteSession;)V
    .locals 0
    .parameter "session"

    .prologue
    .line 125
    invoke-interface {p1}, Lorg/eclipse/jgit/transport/RemoteSession;->disconnect()V

    .line 126
    return-void
.end method

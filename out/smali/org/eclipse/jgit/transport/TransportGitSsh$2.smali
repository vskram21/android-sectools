.class Lorg/eclipse/jgit/transport/TransportGitSsh$2;
.super Lorg/eclipse/jgit/transport/SshSessionFactory;
.source "TransportGitSsh.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/TransportGitSsh;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/TransportGitSsh;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportGitSsh;)V
    .locals 0
    .parameter

    .prologue
    .line 134
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$2;->this$0:Lorg/eclipse/jgit/transport/TransportGitSsh;

    invoke-direct {p0}, Lorg/eclipse/jgit/transport/SshSessionFactory;-><init>()V

    return-void
.end method


# virtual methods
.method public getSession(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/transport/CredentialsProvider;Lorg/eclipse/jgit/util/FS;I)Lorg/eclipse/jgit/transport/RemoteSession;
    .locals 3
    .parameter "uri2"
    .parameter "credentialsProvider"
    .parameter "fs"
    .parameter "tms"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 139
    new-instance v0, Lorg/eclipse/jgit/transport/TransportGitSsh$ExtSession;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$2;->this$0:Lorg/eclipse/jgit/transport/TransportGitSsh;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/transport/TransportGitSsh$ExtSession;-><init>(Lorg/eclipse/jgit/transport/TransportGitSsh;Lorg/eclipse/jgit/transport/TransportGitSsh$1;)V

    return-object v0
.end method

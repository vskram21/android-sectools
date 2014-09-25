.class public Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
.super Ljava/lang/Object;
.source "OpenSshConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/OpenSshConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Host"
.end annotation


# instance fields
.field batchMode:Ljava/lang/Boolean;

.field connectionAttempts:I

.field hostName:Ljava/lang/String;

.field identityFile:Ljava/io/File;

.field patternsApplied:Z

.field port:I

.field preferredAuthentications:Ljava/lang/String;

.field strictHostKeyChecking:Ljava/lang/String;

.field user:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 331
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method copyFrom(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;)V
    .locals 1
    .parameter "src"

    .prologue
    .line 351
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->hostName:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 352
    iget-object v0, p1, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->hostName:Ljava/lang/String;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->hostName:Ljava/lang/String;

    .line 353
    :cond_0
    iget v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->port:I

    if-nez v0, :cond_1

    .line 354
    iget v0, p1, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->port:I

    iput v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->port:I

    .line 355
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->identityFile:Ljava/io/File;

    if-nez v0, :cond_2

    .line 356
    iget-object v0, p1, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->identityFile:Ljava/io/File;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->identityFile:Ljava/io/File;

    .line 357
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->user:Ljava/lang/String;

    if-nez v0, :cond_3

    .line 358
    iget-object v0, p1, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->user:Ljava/lang/String;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->user:Ljava/lang/String;

    .line 359
    :cond_3
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->preferredAuthentications:Ljava/lang/String;

    if-nez v0, :cond_4

    .line 360
    iget-object v0, p1, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->preferredAuthentications:Ljava/lang/String;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->preferredAuthentications:Ljava/lang/String;

    .line 361
    :cond_4
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->batchMode:Ljava/lang/Boolean;

    if-nez v0, :cond_5

    .line 362
    iget-object v0, p1, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->batchMode:Ljava/lang/Boolean;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->batchMode:Ljava/lang/Boolean;

    .line 363
    :cond_5
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->strictHostKeyChecking:Ljava/lang/String;

    if-nez v0, :cond_6

    .line 364
    iget-object v0, p1, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->strictHostKeyChecking:Ljava/lang/String;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->strictHostKeyChecking:Ljava/lang/String;

    .line 365
    :cond_6
    iget v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->connectionAttempts:I

    if-nez v0, :cond_7

    .line 366
    iget v0, p1, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->connectionAttempts:I

    iput v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->connectionAttempts:I

    .line 367
    :cond_7
    return-void
.end method

.method public getConnectionAttempts()I
    .locals 1

    .prologue
    .line 432
    iget v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->connectionAttempts:I

    return v0
.end method

.method public getHostName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 383
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->hostName:Ljava/lang/String;

    return-object v0
.end method

.method public getIdentityFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 398
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->identityFile:Ljava/io/File;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 390
    iget v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->port:I

    return v0
.end method

.method public getPreferredAuthentications()Ljava/lang/String;
    .locals 1

    .prologue
    .line 413
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->preferredAuthentications:Ljava/lang/String;

    return-object v0
.end method

.method public getStrictHostKeyChecking()Ljava/lang/String;
    .locals 1

    .prologue
    .line 376
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->strictHostKeyChecking:Ljava/lang/String;

    return-object v0
.end method

.method public getUser()Ljava/lang/String;
    .locals 1

    .prologue
    .line 405
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->user:Ljava/lang/String;

    return-object v0
.end method

.method public isBatchMode()Z
    .locals 1

    .prologue
    .line 421
    iget-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->batchMode:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->batchMode:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

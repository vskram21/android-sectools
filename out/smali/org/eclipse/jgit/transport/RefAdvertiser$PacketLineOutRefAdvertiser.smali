.class public Lorg/eclipse/jgit/transport/RefAdvertiser$PacketLineOutRefAdvertiser;
.super Lorg/eclipse/jgit/transport/RefAdvertiser;
.source "RefAdvertiser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/RefAdvertiser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PacketLineOutRefAdvertiser"
.end annotation


# instance fields
.field private final pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/transport/PacketLineOut;)V
    .locals 0
    .parameter "out"

    .prologue
    .line 73
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/RefAdvertiser;-><init>()V

    .line 74
    iput-object p1, p0, Lorg/eclipse/jgit/transport/RefAdvertiser$PacketLineOutRefAdvertiser;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    .line 75
    return-void
.end method


# virtual methods
.method protected end()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RefAdvertiser$PacketLineOutRefAdvertiser;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/PacketLineOut;->end()V

    .line 85
    return-void
.end method

.method protected writeOne(Ljava/lang/CharSequence;)V
    .locals 2
    .parameter "line"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RefAdvertiser$PacketLineOutRefAdvertiser;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    .line 80
    return-void
.end method

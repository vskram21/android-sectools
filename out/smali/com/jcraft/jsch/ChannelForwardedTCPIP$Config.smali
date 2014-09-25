.class abstract Lcom/jcraft/jsch/ChannelForwardedTCPIP$Config;
.super Ljava/lang/Object;
.source "ChannelForwardedTCPIP.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jcraft/jsch/ChannelForwardedTCPIP;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "Config"
.end annotation


# instance fields
.field address_to_bind:Ljava/lang/String;

.field allocated_rport:I

.field rport:I

.field session:Lcom/jcraft/jsch/Session;

.field target:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 315
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

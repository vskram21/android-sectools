.class public interface abstract Lorg/openintents/openpgp/IOpenPgpService;
.super Ljava/lang/Object;
.source "IOpenPgpService.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/openintents/openpgp/IOpenPgpService$Stub;
    }
.end annotation


# virtual methods
.method public abstract execute(Landroid/content/Intent;Landroid/os/ParcelFileDescriptor;Landroid/os/ParcelFileDescriptor;)Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
